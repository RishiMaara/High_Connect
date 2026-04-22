import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

/// X (Twitter) Sign-In using Firebase OAuth
/// Uses Firebase's built-in Twitter provider
Future<UserCredential?> twitterSignInFunc() async {
  try {
    if (kIsWeb) {
      // Web: Use popup-based sign-in
      final provider = TwitterAuthProvider();
      return await FirebaseAuth.instance.signInWithPopup(provider);
    } else {
      // Mobile: Use redirect-based sign-in
      final provider = TwitterAuthProvider();
      return await FirebaseAuth.instance.signInWithProvider(provider);
    }
  } catch (e) {
    rethrow;
  }
}

Future<void> signOutWithTwitter() async {
  // Firebase handles session cleanup
  // No additional Twitter-specific logout needed
}
