import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:joy_app/src/flavors.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Generates a cryptographically secure random nonce
  String _generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation
  String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  /// Sign in with Apple and authenticate with Firebase
  Future<UserCredential?> signInWithApple() async {
    try {
      // Generate nonce for security
      final rawNonce = _generateNonce();
      final nonce = _sha256ofString(rawNonce);

      // Request Apple ID credential
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
        // For Android/Web - use your Service ID
        webAuthenticationOptions: Platform.isAndroid
            ? F.webAuthOptionsForAppleSignIn
            : null, // webAuthenticationOptions can be null for iOS/macOS
      );

      // Create OAuth credential for Firebase
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
        accessToken: appleCredential.authorizationCode,
      );

      // Sign in to Firebase with the credential
      final userCredential = await _auth.signInWithCredential(oauthCredential);

      // Update display name if available (only on first sign in)
      if (appleCredential.givenName != null ||
          appleCredential.familyName != null) {
        final displayName =
            '${appleCredential.givenName ?? ''} ${appleCredential.familyName ?? ''}'
                .trim();

        if (displayName.isNotEmpty) {
          await userCredential.user?.updateDisplayName(displayName);
        }
      }

      // Update email if available (only on first sign in)
      if (appleCredential.email != null) {
        // Email is already set by Firebase, but you can store it separately if needed
        print('User email: ${appleCredential.email}');
      }

      return userCredential;
    } on SignInWithAppleAuthorizationException catch (e) {
      _handleAppleAuthException(e);
      return null;
    } on FirebaseAuthException catch (e) {
      _handleFirebaseAuthException(e);
      return null;
    } catch (e) {
      print('Error during Apple Sign In: $e');
      rethrow;
    }
  }

  /// Handle Apple authorization exceptions
  void _handleAppleAuthException(SignInWithAppleAuthorizationException e) {
    switch (e.code) {
      case AuthorizationErrorCode.canceled:
        print('User canceled Apple Sign In');
        break;
      case AuthorizationErrorCode.failed:
        print('Apple Sign In failed: ${e.message}');
        throw Exception('Apple Sign In failed');
      case AuthorizationErrorCode.invalidResponse:
        print('Invalid response from Apple: ${e.message}');
        throw Exception('Invalid response from Apple');
      case AuthorizationErrorCode.notHandled:
        print('Apple Sign In not handled: ${e.message}');
        throw Exception('Apple Sign In not handled');
      case AuthorizationErrorCode.unknown:
        print('Unknown Apple Sign In error: ${e.message}');
        throw Exception('Unknown error occurred');
      default:
        print('Apple Sign In error: ${e.message}');
        throw Exception('Sign in error: ${e.message}');
    }
  }

  /// Handle Firebase authentication exceptions
  void _handleFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'account-exists-with-different-credential':
        print('Account exists with different credential');
        throw Exception(
            'An account already exists with the same email address but different sign-in credentials.');
      case 'invalid-credential':
        print('Invalid credential');
        throw Exception('The credential is invalid or has expired.');
      case 'operation-not-allowed':
        print('Operation not allowed');
        throw Exception(
            'Apple Sign In is not enabled. Please contact support.');
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
      default:
        print('Firebase Auth error: ${e.code} - ${e.message}');
        throw Exception('Authentication error: ${e.message}');
    }
  }

  /// Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
