import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Must stay top-level for [FirebaseMessaging.onBackgroundMessage].
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  if (kIsWeb) return;

  debugPrint(
    '[FCM][background] id=${message.messageId} title=${message.notification?.title} data=${message.data}',
  );

  const channelId = 'high_connect_notifications';
  const channelName = 'HIGH Connect Notifications';
  const channelDescription = 'Bookings, messages, and updates';

  final plugin = FlutterLocalNotificationsPlugin();

  if (Platform.isAndroid) {
    await plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(
          const AndroidNotificationChannel(
            channelId,
            channelName,
            description: channelDescription,
            importance: Importance.high,
            playSound: true,
            enableVibration: true,
            showBadge: true,
          ),
        );
  }

  const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
  const iosInit = DarwinInitializationSettings();
  await plugin.initialize(
    const InitializationSettings(android: androidInit, iOS: iosInit),
  );

  final n = message.notification;
  final title = n?.title ??
      message.data['title']?.toString() ??
      'HIGH Connect';
  final body = n?.body ??
      message.data['body']?.toString() ??
      'You have a new update.';

  final androidDetails = AndroidNotificationDetails(
    channelId,
    channelName,
    channelDescription: channelDescription,
    importance: Importance.high,
    priority: Priority.high,
    icon: '@mipmap/ic_launcher',
    styleInformation: BigTextStyleInformation(body),
  );

  const iosDetails = DarwinNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  await plugin.show(
    message.hashCode,
    title,
    body,
    NotificationDetails(android: androidDetails, iOS: iosDetails),
    payload: message.data.isNotEmpty ? message.data.toString() : null,
  );
}
