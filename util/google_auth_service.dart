import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/userinfo.profile',
    ],
  );

  /// Sign in with Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      // If user cancels the sign-in
      if (googleUser == null) {
        print('User canceled Google Sign In');
        return null;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the credential
      final userCredential = await _auth.signInWithCredential(credential);

      print('✅ Signed in: ${userCredential.user?.uid}');
      print('✅ Email: ${userCredential.user?.email}');
      print('✅ Display Name: ${userCredential.user?.displayName}');
      print('✅ Photo URL: ${userCredential.user?.photoURL}');

      return userCredential;
    } on FirebaseAuthException catch (e) {
      _handleFirebaseAuthException(e);
      return null;
    } catch (e) {
      print('Error during Google Sign In: $e');
      rethrow;
    }
  }

  /// Sign out from both Google and Firebase
  Future<void> signOut() async {
    await Future.wait([
      _auth.signOut(),
      _googleSignIn.signOut(),
    ]);
    print('✅ Signed out successfully');
  }

  /// Disconnect Google account (revoke access)
  Future<void> disconnect() async {
    await _googleSignIn.disconnect();
    await _auth.signOut();
    print('✅ Disconnected Google account');
  }

  /// Handle Firebase authentication exceptions
  void _handleFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'account-exists-with-different-credential':
        print('Account exists with different credential');
        throw Exception(
          'An account already exists with the same email address but different sign-in credentials.',
        );
      case 'invalid-credential':
        print('Invalid credential');
        throw Exception('The credential is invalid or has expired.');
      case 'operation-not-allowed':
        print('Operation not allowed');
        throw Exception(
            'Google Sign In is not enabled. Please contact support.');
      case 'user-disabled':
        print('User disabled');
        throw Exception('This user account has been disabled.');
      case 'user-not-found':
        print('User not found');
        throw Exception('No user found with this credential.');
      case 'wrong-password':
        print('Wrong password');
        throw Exception('Invalid password.');
      case 'invalid-verification-code':
        print('Invalid verification code');
        throw Exception('The verification code is invalid.');
      case 'invalid-verification-id':
        print('Invalid verification ID');
        throw Exception('The verification ID is invalid.');
      case 'network-request-failed':
        print('Network request failed');
        throw Exception(
            'Network error. Please check your internet connection.');
      default:
        print('Firebase Auth error: ${e.code} - ${e.message}');
        throw Exception('Authentication error: ${e.message}');
    }
  }

  /// Re-authenticate user (useful before sensitive operations)
  Future<UserCredential?> reauthenticateWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await _auth.currentUser?.reauthenticateWithCredential(credential);
    } catch (e) {
      print('Re-authentication error: $e');
      rethrow;
    }
  }
}
