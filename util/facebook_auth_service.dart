import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  /// Sign in with Facebook
  Future<UserCredential?> signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult result = await _facebookAuth.login(
        permissions: ['email', 'public_profile'],
      );

      // Check for cancellation
      if (result.status == LoginStatus.cancelled) {
        print('❌ Facebook login cancelled by user');
        return null;
      }

      // Check for errors
      if (result.status == LoginStatus.failed) {
        print('❌ Facebook login failed: ${result.message}');
        throw Exception('Facebook login failed: ${result.message}');
      }

      // Success - get access token
      final AccessToken? accessToken = result.accessToken;

      if (accessToken == null) {
        throw Exception('Failed to get Facebook access token');
      }

      print('✅ Got Facebook access token: ${accessToken.tokenString}');

      // Create Firebase credential from Facebook access token
      final credential =
          FacebookAuthProvider.credential(accessToken.tokenString);

      // Sign in to Firebase
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
      print('Error during Facebook Sign In: $e');
      rethrow;
    }
  }

  /// Get user profile picture
  Future<String?> getUserProfilePicture(String userId) async {
    try {
      final result = await _facebookAuth.getUserData(
        fields: 'picture.width(200).height(200)',
      );

      final picture = result['picture']['data']['url'];
      return picture;
    } catch (e) {
      print('Error getting profile picture: $e');
      return null;
    }
  }

  /// Get additional user data
  Future<Map<String, dynamic>?> getUserAdditionalData() async {
    try {
      final userData = await _facebookAuth.getUserData(
        fields: 'email,name,picture.width(200).height(200),birthday,location',
      );

      return userData;
    } catch (e) {
      print('Error getting user data: $e');
      return null;
    }
  }

  /// Check if user is logged in
  Future<bool> isUserLoggedIn() async {
    final accessToken = await _facebookAuth.accessToken;
    return accessToken != null;
  }

  /// Sign out from both Facebook and Firebase
  Future<void> signOut() async {
    await Future.wait([
      _auth.signOut(),
      _facebookAuth.logOut(),
    ]);
    print('✅ Signed out successfully');
  }

  /// Revoke access (disconnect)
  Future<void> disconnect() async {
    // Note: Facebook doesn't have a programmatic revoke like Google
    // Users must revoke access through Facebook settings
    await _facebookAuth.logOut();
    await _auth.signOut();
    print(
        '⚠️ Logged out. User must revoke app access through Facebook settings.');
  }

  /// Get current user
  User? get currentUser => _auth.currentUser;

  /// Stream of auth state changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();

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
            'Facebook Sign In is not enabled. Please contact support.');
      case 'user-disabled':
        print('User disabled');
        throw Exception('This user account has been disabled.');
      case 'user-not-found':
        print('User not found');
        throw Exception('No user found with this credential.');
      case 'network-request-failed':
        print('Network request failed');
        throw Exception(
            'Network error. Please check your internet connection.');
      default:
        print('Firebase Auth error: ${e.code} - ${e.message}');
        throw Exception('Authentication error: ${e.message}');
    }
  }
}
