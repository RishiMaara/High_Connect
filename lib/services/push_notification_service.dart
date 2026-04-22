import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Top-level function for handling background messages
/// Must be a top-level function (not a method)
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Handle background message
  print('Handling background message: ${message.messageId}');
  // The notification will be shown automatically by the system
}

/// Push Notification Service for FCM
/// Handles initialization, token management, and notification display
class PushNotificationService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  // Android notification channel ID
  static const String _channelId = 'high_connect_notifications';
  static const String _channelName = 'HIGH Connect Notifications';
  static const String _channelDescription = 'Notifications for bookings, messages, and updates';

  /// Initialize FCM and request permissions
  static Future<void> initialize() async {
    if (kIsWeb) {
      // Web FCM has different initialization - skip for now
      return;
    }

    try {
      // Set up background message handler
      FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

      // Request notification permissions
      final settings = await _messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      print('FCM Permission status: ${settings.authorizationStatus}');

      if (settings.authorizationStatus == AuthorizationStatus.authorized ||
          settings.authorizationStatus == AuthorizationStatus.provisional) {
        // Create notification channel for Android 8+
        await _createNotificationChannel();

        // Initialize local notifications for foreground display
        await _initLocalNotifications();

        // Set up foreground notification handler
        _setupForegroundHandler();

        // Get and save FCM token
        await _saveToken();

        // Listen for token refresh
        _messaging.onTokenRefresh.listen(_saveTokenToFirestore);
      }
    } catch (e) {
      print('Error initializing FCM: $e');
    }
  }

  /// Create Android notification channel (required for Android 8+)
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
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  /// Initialize local notifications for foreground display
  static Future<void> _initLocalNotifications() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false, // Already requested via FCM
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );
  }

  /// Handle notification tap
  static void _onNotificationTapped(NotificationResponse response) {
    // Handle notification tap - navigate to appropriate screen
    print('Notification tapped: ${response.payload}');
    // TODO: Add navigation logic based on payload
  }

  /// Setup foreground message handler
  static void _setupForegroundHandler() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received foreground message: ${message.messageId}');

      final notification = message.notification;
      final data = message.data;
      
      // Check if this is a booking-related notification
      if (_isBookingNotification(data)) {
        _triggerBookingBadge();
      }
      
      if (notification != null) {
        // Show local notification
        _showLocalNotification(
          title: notification.title ?? 'HIGH Connect',
          body: notification.body ?? '',
          payload: data.toString(),
        );
      }
    });

    // Handle notification tap when app is in background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Notification opened app: ${message.messageId}');
      
      final data = message.data;
      // Check if this is a booking-related notification
      if (_isBookingNotification(data)) {
        _triggerBookingBadge();
      }
      // TODO: Navigate to appropriate screen based on message data
    });
  }
  
  /// Check if notification is booking-related
  static bool _isBookingNotification(Map<String, dynamic> data) {
    final type = data['type']?.toString().toLowerCase() ?? '';
    return type.contains('booking') || 
           type.contains('appointment') ||
           data.containsKey('bookingId') ||
           data.containsKey('booking_id');
  }
  
  /// Trigger red dot badge on bookings tab
  static void _triggerBookingBadge() {
    // Import app_state and trigger badge
    // This will be picked up by the navigation bar
    try {
      // Use a static callback registered by the app
      if (_onBookingNotification != null) {
        _onBookingNotification!();
      }
    } catch (e) {
      print('Error triggering booking badge: $e');
    }
  }
  
  // Static callback for booking notifications
  static VoidCallback? _onBookingNotification;
  
  /// Register callback for booking notifications
  /// Call this from main.dart after app initialization
  static void registerBookingCallback(VoidCallback callback) {
    _onBookingNotification = callback;
  }

  /// Show local notification (for foreground messages)
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
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _localNotifications.show(
      DateTime.now().millisecondsSinceEpoch.remainder(100000),
      title,
      body,
      details,
      payload: payload,
    );
  }

  /// Get FCM token and save to Firestore
  static Future<void> _saveToken() async {
    try {
      final token = await _messaging.getToken();
      if (token != null) {
        await _saveTokenToFirestore(token);
      }
    } catch (e) {
      print('Error getting FCM token: $e');
    }
  }

  /// Save FCM token to current user's Firestore document
  static Future<void> _saveTokenToFirestore(String token) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update({
          'fcmToken': token,
          'fcmTokenUpdatedAt': FieldValue.serverTimestamp(),
        });
        print('FCM token saved to Firestore');
      }
    } catch (e) {
      print('Error saving FCM token: $e');
    }
  }

  /// Refresh FCM token (call on app start when user is logged in)
  static Future<void> refreshToken() async {
    if (kIsWeb) return;
    await _saveToken();
  }
}
