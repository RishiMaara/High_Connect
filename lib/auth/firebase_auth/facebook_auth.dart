import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

/// Facebook Sign-In using Firebase OAuth
/// Uses Firebase's built-in Facebook provider
Future<UserCredential?> facebookSignInFunc() async {
  try {
    if (kIsWeb) {
      // Web: Use popup-based sign-in
      final provider = FacebookAuthProvider();
      provider.addScope('email');
      provider.addScope('public_profile');
      return await FirebaseAuth.instance.signInWithPopup(provider);
    } else {
      // Mobile: Use redirect-based sign-in
      final provider = FacebookAuthProvider();
      provider.addScope('email');
      provider.addScope('public_profile');
      return await FirebaseAuth.instance.signInWithProvider(provider);
    }
  } catch (e) {
    rethrow;
  }
}

Future<void> signOutWithFacebook() async {
  // Firebase handles session cleanup
  // No additional Facebook-specific logout needed
}
