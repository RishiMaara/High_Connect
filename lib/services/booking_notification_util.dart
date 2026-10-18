import 'package:flutter/foundation.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Writes provider in-app notification + metadata. A Cloud Function sends FCM
/// when `users/{providerUid}/notifications/{id}` is created.
class BookingNotificationUtil {
  BookingNotificationUtil._();

  static String _formatWhen(DateTime dt) {
    return dateTimeFormat('MMM d, y · h:mm a', dt, locale: 'en');
  }

  /// Notifies the service provider of a new booking request (push via Cloud Function).
  static Future<void> notifyProviderOfBookingRequest({
    required DocumentReference providerRef,
    required ServicesRecord? serviceDoc,
    required DateTime bookingWhen,
    required int bookingNumber,
    required DocumentReference bookingDocRef,
  }) async {
    final customerName = currentUserDisplayName.isNotEmpty
        ? currentUserDisplayName
        : 'A customer';
    final serviceTitle =
        (serviceDoc?.title ?? '').trim().isNotEmpty ? serviceDoc!.title : 'Your service';

    final whenStr = _formatWhen(bookingWhen);
    final title = 'New booking request';
    final description =
        '$customerName requested "$serviceTitle" · Ref #$bookingNumber · $whenStr. Open HIGH Connect to accept or decline.';

    try {
      await NotificationsRecord.createDoc(providerRef).set({
        ...createNotificationsRecordData(
          title: title,
          description: description,
          type: 'booking_request',
          timeStamp: getCurrentTimestamp,
          read: false,
        ),
        ...mapToFirestore({
          'customer_name': customerName,
          'service_title': serviceTitle,
          'booking_number': bookingNumber,
          'booking_ref': bookingDocRef.path,
          'dedupe_key': bookingDocRef.path,
        }),
      });
      debugPrint(
        '[BookingNotification] Provider notification doc written for ${providerRef.path}',
      );
    } catch (e, st) {
      debugPrint('[BookingNotification] Failed to write notification: $e\n$st');
      rethrow;
    }
  }
}
