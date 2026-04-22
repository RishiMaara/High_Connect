import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Set to true to use Firebase Auth Emulator (bypasses reCAPTCHA completely)
const bool useFirebaseEmulator = false;

// Firebase configuration from environment variables (--dart-define)
// Usage: flutter run --dart-define=FIREBASE_API_KEY=your_key
const String _firebaseApiKey = String.fromEnvironment(
  'FIREBASE_API_KEY',
  defaultValue: 'AIzaSyBE_gFqDXdkruPWOrX-INo6FJhAloxqyZg',
);
const String _firebaseAuthDomain = String.fromEnvironment(
  'FIREBASE_AUTH_DOMAIN',
  defaultValue: 'high-connect-3.firebaseapp.com',
);
const String _firebaseProjectId = String.fromEnvironment(
  'FIREBASE_PROJECT_ID',
  defaultValue: 'high-connect-3',
);
const String _firebaseStorageBucket = String.fromEnvironment(
  'FIREBASE_STORAGE_BUCKET',
  defaultValue: 'high-connect-3.firebasestorage.app',
);
const String _firebaseMessagingSenderId = String.fromEnvironment(
  'FIREBASE_MESSAGING_SENDER_ID',
  defaultValue: '312816055234',
);
const String _firebaseAppId = String.fromEnvironment(
  'FIREBASE_APP_ID',
  defaultValue: '1:312816055234:web:9f819b03616d1480f25c5b',
);
const String _firebaseMeasurementId = String.fromEnvironment(
  'FIREBASE_MEASUREMENT_ID',
  defaultValue: 'G-26JW5T8LCN',
);

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: _firebaseApiKey,
            authDomain: _firebaseAuthDomain,
            projectId: _firebaseProjectId,
            storageBucket: _firebaseStorageBucket,
            messagingSenderId: _firebaseMessagingSenderId,
            appId: _firebaseAppId,
            measurementId: _firebaseMeasurementId));
    
    // Use Firebase Auth Emulator for local development (bypasses reCAPTCHA)
    // Only enable when useFirebaseEmulator = true (see top of file)
    if (useFirebaseEmulator && kDebugMode) {
      await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    }
    // NOTE: Do NOT set appVerificationDisabledForTesting here.
    // That disables Phone Auth entirely and breaks release builds.
    // Use Firebase Console > Authentication > Test phone numbers instead.
  } else {
    await Firebase.initializeApp();
  }
}
