import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart' show VoidCallback, debugPrint, kIsWeb;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Push + local notification orchestration for HIGH Connect.
///
/// Server-side FCM is sent by Cloud Function `sendPushOnUserNotification` when a
/// document is created under `users/{uid}/notifications/{id}`.
class PushNotificationService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  static const String _channelId = 'high_connect_notifications';
  static const String _channelName = 'HIGH Connect Notifications';
  static const String _channelDescription =
      'Notifications for bookings, messages, and updates';

  static void Function(String title, String body)? _onShowBanner;
  static VoidCallback? _onBookingNotification;

  /// Call after [initFirebase] and permission flow. Background handler is
  /// registered from [main] via [FirebaseMessaging.onBackgroundMessage].
  static Future<void> initialize() async {
    if (kIsWeb) return;

    try {
      final settings = await _messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: true,
        sound: true,
      );

      debugPrint(
        '[FCM] permission=${settings.authorizationStatus}',
      );

      if (Platform.isAndroid) {
        final androidPlugin = _localNotifications
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>();
        final granted = await androidPlugin?.requestNotificationsPermission();
        debugPrint('[FCM] Android POST_NOTIFICATIONS granted=$granted');
      }

      await _createNotificationChannel();
      await _initLocalNotifications();

      // Allow FCM to show notifications in the system bar even when app is in foreground
      await _messaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );

      _setupForegroundHandler();
      _setupOpenedFromBackgroundHandler();

      if (settings.authorizationStatus == AuthorizationStatus.authorized ||
          settings.authorizationStatus == AuthorizationStatus.provisional) {
        await _saveToken();
        _messaging.onTokenRefresh.listen(_persistTokenToFirestore);
      }

      await _logInitialAndTerminatedLaunch();
    } catch (e, st) {
      debugPrint('[FCM] initialize failed: $e\n$st');
    }
  }

  static Future<void> _createNotificationChannel() async {
    if (!Platform.isAndroid) return;

    const channel = AndroidNotificationChannel(
      _channelId,
      _channelName,
      description: _channelDescription,
      importance: Importance.high,
      playSound: true,
      enableVibration: true,
      showBadge: true,
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  static Future<void> _initLocalNotifications() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    await _localNotifications.initialize(
      const InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
      ),
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );
  }

  static void _onNotificationTapped(NotificationResponse response) {
    debugPrint('[FCM] local notification tap payload=${response.payload}');
  }

  static void registerBannerCallback(
    void Function(String title, String body) callback,
  ) {
    _onShowBanner = callback;
  }

  static void registerBookingCallback(VoidCallback callback) {
    _onBookingNotification = callback;
  }

  static void _setupForegroundHandler() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint(
        '[FCM][foreground] id=${message.messageId} data=${message.data}',
      );

      final data = message.data;
      if (_isBookingNotification(data)) {
        _triggerBookingBadge();
      }

      final notification = message.notification;
      final title = notification?.title ??
          data['title']?.toString() ??
          'HIGH Connect';
      final body = notification?.body ??
          data['body']?.toString() ??
          'You have a new update.';

      // Always show in the system notification bar (even in foreground)
      _showLocalNotification(
        title: title,
        body: body,
        payload: data.isNotEmpty ? data.toString() : null,
      );

      // Also show the in-app banner if callback is registered
      _onShowBanner?.call(title, body);
    });
  }

  static void _setupOpenedFromBackgroundHandler() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('[FCM] opened from background id=${message.messageId}');
      if (_isBookingNotification(message.data)) {
        _triggerBookingBadge();
      }
    });
  }

  static Future<void> _logInitialAndTerminatedLaunch() async {
    final initial = await _messaging.getInitialMessage();
    if (initial != null) {
      debugPrint(
        '[FCM] cold start from notification id=${initial.messageId} data=${initial.data}',
      );
      if (_isBookingNotification(initial.data)) {
        _triggerBookingBadge();
      }
    }
  }

  static bool _isBookingNotification(Map<String, dynamic> data) {
    final type = data['type']?.toString().toLowerCase() ?? '';
    return type.contains('booking') ||
        type.contains('appointment') ||
        data.containsKey('bookingId') ||
        data.containsKey('booking_id') ||
        data.containsKey('booking_ref');
  }

  static void _triggerBookingBadge() {
    try {
      _onBookingNotification?.call();
    } catch (e, st) {
      debugPrint('[FCM] booking badge callback error: $e\n$st');
    }
  }

  static Future<void> _showLocalNotification({
    required String title,
    required String body,
    String? payload,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDescription,
      importance: Importance.high,
      priority: Priority.high,
      showWhen: true,
      icon: '@mipmap/ic_launcher',
      styleInformation: null,
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    await _localNotifications.show(
      DateTime.now().millisecondsSinceEpoch.remainder(100000),
      title,
      body,
      const NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      ),
      payload: payload,
    );
  }

  static Future<void> _saveToken() async {
    try {
      final token = await _messaging.getToken();
      if (token != null) {
        await _persistTokenToFirestore(token);
      } else {
        debugPrint('[FCM] getToken returned null');
      }
    } catch (e, st) {
      debugPrint('[FCM] getToken error: $e\n$st');
    }
  }

  static Future<void> _persistTokenToFirestore(String token) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        debugPrint('[FCM] skip token save — no signed-in user');
        return;
      }
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set(
        {
          'fcmToken': token,
          'fcmTokenUpdatedAt': FieldValue.serverTimestamp(),
        },
        SetOptions(merge: true),
      );
      debugPrint('[FCM] token persisted for uid=${user.uid}');
    } catch (e, st) {
      debugPrint('[FCM] token save failed: $e\n$st');
    }
  }

  static Future<void> refreshToken() async {
    if (kIsWeb) return;
    // Retry up to 3 times with increasing delays to handle the case where
    // the user document isn't ready in Firestore immediately after login.
    for (int attempt = 1; attempt <= 3; attempt++) {
      try {
        final user = FirebaseAuth.instance.currentUser;
        if (user == null) {
          debugPrint('[FCM] refreshToken: no user on attempt $attempt, waiting...');
          await Future.delayed(Duration(seconds: attempt * 2));
          continue;
        }
        await _saveToken();
        debugPrint('[FCM] refreshToken succeeded on attempt $attempt');
        return;
      } catch (e) {
        debugPrint('[FCM] refreshToken attempt $attempt failed: $e');
        if (attempt < 3) await Future.delayed(Duration(seconds: attempt * 2));
      }
    }
  }
}
