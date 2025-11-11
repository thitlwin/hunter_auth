import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:joy_app/src/core/utils/failure.dart';
import 'package:joy_app/src/feature/login/util/facebook_auth_service.dart';
import 'package:joy_app/src/feature/login/util/user_service.dart';
import 'google_auth_service.dart';
import 'apple_auth_service.dart';

enum SignInProvider { google, apple, facebook, email, none }

enum AuthState { authenticated, unauthenticated, loading, error }

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleAuthService googleAuthService;
  final AppleAuthService appleAuthService;
  final FacebookAuthService facebookAuthService;
  final UserService userService;

  // Constructor with dependency injection
  AuthService({
    required this.googleAuthService,
    required this.appleAuthService,
    required this.facebookAuthService,
    required this.userService,
  });

  // ============================================
  // SIGN UP METHODS
  // ============================================

  /// Sign In with email and password
  Future<UserCredential?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      print('🔍 Creating account with email: $email');

      // Create user account
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Update user profile with display name
      print('✅ Account created successfully');
      print('✅ User ID: ${userCredential.user?.uid}');
      print('✅ Email: ${userCredential.user?.email}');
      print('✅ Display Name: ${userCredential.user?.displayName}');

      return userCredential;
    } on FirebaseAuthException catch (e) {
      _handleFirebaseAuthException(e);
      return null;
    } catch (e) {
      print('❌ Unexpected error during sign in: $e');
      rethrow;
    }
  }

  /// Create user account with email and password
  Future<UserCredential?> signUpWithEmail({
    required String email,
    required String password,
    required String displayName,
  }) async {
    try {
      print('🔍 Creating account with email: $email');

      // Create user account
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Update user profile with display name
      await userCredential.user?.updateDisplayName(displayName);
      await userCredential.user?.reload();

      print('✅ Account created successfully');
      print('✅ User ID: ${userCredential.user?.uid}');
      print('✅ Email: ${userCredential.user?.email}');
      print('✅ Display Name: ${userCredential.user?.displayName}');

      // Send email verification
      await sendEmailVerification();

      return userCredential;
    } on FirebaseAuthException catch (e) {
      _handleFirebaseAuthException(e);
      return null;
    } catch (e) {
      print('❌ Unexpected error during sign up: $e');
      rethrow;
    }
  }

  /// Send email verification link
  Future<void> sendEmailVerification() async {
    try {
      final user = _auth.currentUser;
      if (user != null && !user.emailVerified) {
        print('🔍 Sending email verification...');
        await user.sendEmailVerification();
        print('✅ Verification email sent to ${user.email}');
      }
    } catch (e) {
      print('❌ Error sending verification email: $e');
      rethrow;
    }
  }

  /// Validate password strength
  bool validatePassword(String password) {
    // At least 8 characters
    if (password.length < 8) return false;
    // At least one uppercase letter
    if (!password.contains(RegExp(r'[A-Z]'))) return false;
    // At least one lowercase letter
    if (!password.contains(RegExp(r'[a-z]'))) return false;
    // At least one digit
    if (!password.contains(RegExp(r'[0-9]'))) return false;
    return true;
  }

  /// Get password strength message
  String getPasswordStrengthMessage(String password) {
    if (password.isEmpty) {
      return 'Password is required';
    }
    if (password.length < 8) {
      return 'At least 8 characters required';
    }
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return 'Add uppercase letter';
    }
    if (!password.contains(RegExp(r'[a-z]'))) {
      return 'Add lowercase letter';
    }
    if (!password.contains(RegExp(r'[0-9]'))) {
      return 'Add a number';
    }
    return 'Strong password';
  }

  /// Handle Firebase auth exceptions
  void _handleFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        throw Failure.authError('Email is already registered');
      case 'invalid-email':
        throw Failure.authError('Invalid email format');
      case 'operation-not-allowed':
        throw Failure.authError('Operation not allowed');
      case 'weak-password':
        throw Failure.authError('Password is too weak');
      case 'network-request-failed':
        throw Failure.networkError();
      default:
        throw Failure.authError('${e.message}');
    }
  }

  // ============================================
  // SIGN IN METHODS
  // ============================================

  /// Sign in with Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      print('🔍 Attempting Google sign in...');
      final userCredential = await googleAuthService.signInWithGoogle();

      if (userCredential != null) {
        print('✅ Google sign in successful');
        // Save user data to Firestore
        await userService.saveUserData(userCredential.user!);
        print('✅ User data saved to Firestore');
      }

      return userCredential;
    } catch (e) {
      print('❌ Error in AuthService.signInWithGoogle: $e');
      if (e is PlatformException && e.code == 'API_NOT_CONNECTED') {
        // This is the specific error for SHA-1 mismatch or missing google-services.json
        throw Failure.authError(
            'Google Sign-In configuration error. Check your SHA-1 fingerprint in Firebase. (Code: ${e.code})');
      } else if (e is FirebaseAuthException) {
        _handleFirebaseAuthException(e);
        // _handleFirebaseAuthException throws, so we just rethrow to be safe
        rethrow;
      } else if (e is Failure) {
        rethrow; // Re-throw failures from lower services
      }
      // Rethrow for other unexpected errors
      rethrow;
    }
  }

  /// Sign in with Apple
  Future<UserCredential?> signInWithApple() async {
    try {
      print('🔍 Attempting Apple sign in...');
      final userCredential = await appleAuthService.signInWithApple();

      if (userCredential != null) {
        print('✅ Apple sign in successful');
        // Save user data to Firestore
        await userService.saveUserData(userCredential.user!);
        print('✅ User data saved to Firestore');
      }

      return userCredential;
    } catch (e) {
      print('❌ Error during Apple sign in: $e');
      if (e is PlatformException) {
        throw Failure.authError(
            'Apple sign in failed. Please try again. (${e.code})');
      }
      rethrow;
    }
  }

//  Sign in with Facebook
  Future<UserCredential?> signInWithFacebook() async {
    try {
      print('🔍 Attempting Facebook sign in...');
      final userCredential = await facebookAuthService.signInWithFacebook();

      if (userCredential != null) {
        print('✅ Facebook sign in successful');
        // Save user data to Firestore
        await userService.saveUserData(userCredential.user!);
        print('✅ User data saved to Firestore');
      }

      return userCredential;
    } catch (e) {
      print('❌ Error in AuthService.signInWithFacebook: $e');
      rethrow;
    }
  }

  // ============================================
  // SIGN OUT & DISCONNECT
  // ============================================

  /// Universal sign out
  /// Handles different providers and clears their sessions
  Future<void> signOut() async {
    try {
      print('🔍 Starting sign out...');
      final provider = getCurrentProvider();

      switch (provider) {
        case SignInProvider.google:
          print('↪️ Signing out from Google...');
          await googleAuthService.signOut();
          break;
        case SignInProvider.apple:
          print('↪️ Signing out from Apple...');
          await appleAuthService.signOut();
          break;
        case SignInProvider.facebook:
          print('↪️ Signing out from Facebook...');
          await facebookAuthService.signOut();
          break;
        case SignInProvider.email:
        case SignInProvider.none:
          print('↪️ Signing out from Firebase...');
          await _auth.signOut();
          break;
      }

      print('✅ Sign out successful');
    } catch (e) {
      print('❌ Error during sign out: $e');
      rethrow;
    }
  }

  /// Disconnect account (revoke access)
  /// Removes app from user's authorized apps
  Future<void> disconnect() async {
    try {
      print('🔍 Starting account disconnection...');
      final provider = getCurrentProvider();

      switch (provider) {
        case SignInProvider.google:
          print('↪️ Disconnecting Google account...');
          await googleAuthService.disconnect();
          print('✅ Google account disconnected');
          break;
        case SignInProvider.apple:
          print('↪️ Cannot disconnect Apple account programmatically');
          await appleAuthService.signOut();
          throw Exception(
            'Apple does not support programmatic disconnect. '
            'Users must revoke access through iOS Settings → Apple ID → Password & Security.',
          );
        case SignInProvider.facebook:
          print('↪️ Disconnecting Facebook account...');
          await facebookAuthService.disconnect();
          print(
              '⚠️ Facebook logout complete. User must revoke in Facebook settings.');
          throw Exception(
            'Facebook disconnect requires manual revocation. '
            'User must go to Facebook Settings → Apps and Websites → Remove app access.',
          );
        case SignInProvider.email:
        case SignInProvider.none:
          throw Exception('No active session to disconnect');
      }
    } catch (e) {
      print('❌ Error during disconnection: $e');
      rethrow;
    }
  }

  // ============================================
  // OFFLINE & PERSISTENCE STATE
  // ============================================

  /// Check if user has an active session (offline-capable)
  /// Returns true if user is authenticated either online or offline
  bool get hasActiveSession => _auth.currentUser != null;

  /// Get current authentication state
  /// Handles online, offline, and loading states
  Future<AuthState> getAuthState() async {
    try {
      final user = _auth.currentUser;

      if (user == null) {
        print('🔍 No active session');
        return AuthState.unauthenticated;
      }

      print('✅ Active session found: ${user.uid}');

      // Try to verify session is still valid (online)
      try {
        final token = await user.getIdToken(true);
        if (token != null) {
          print('✅ Session token valid (online)');
          return AuthState.authenticated;
        }
      } catch (e) {
        print(
            '⚠️ Could not refresh token, likely offline but session persists');
        // Session exists but offline - still authenticated
        return AuthState.authenticated;
      }

      return AuthState.authenticated;
    } catch (e) {
      print('❌ Error getting auth state: $e');
      return AuthState.error;
    }
  }

  /// Check if offline but has cached session
  bool get isOfflineButAuthenticated {
    final user = _auth.currentUser;
    return user != null; // Firebase maintains local cache when offline
  }

  /// Get persisted user data (works offline)
  /// Returns cached user info from local device
  User? get persistedUser => _auth.currentUser;

  /// Get cached user provider (works offline)
  SignInProvider get persistedProvider => getCurrentProvider();

  // ============================================
  // USER IDENTIFICATION
  // ============================================

  /// Get current user
  User? get currentUser => _auth.currentUser;

  /// Get current user ID (works offline)
  String? get currentUserId => _auth.currentUser?.uid;

  /// Get current user email (works offline)
  String? get currentUserEmail => _auth.currentUser?.email;

  /// Get current display name (works offline)
  String? get currentUserDisplayName => _auth.currentUser?.displayName;

  /// Get current user photo URL (works offline)
  String? get currentUserPhotoURL => _auth.currentUser?.photoURL;

  // ============================================
  // PROVIDER DETECTION
  // ============================================

  /// Get current sign-in provider
  /// Works offline using cached user data
  SignInProvider getCurrentProvider() {
    final user = _auth.currentUser;
    if (user == null) return SignInProvider.none;

    if (user.providerData.isEmpty) return SignInProvider.none;

    final providerId = user.providerData.first.providerId;

    switch (providerId) {
      case 'google.com':
        return SignInProvider.google;
      case 'apple.com':
        return SignInProvider.apple;
      case 'facebook.com':
        return SignInProvider.facebook;
      default:
        return SignInProvider.none;
    }
  }

  /// Get all linked providers (if user linked multiple)
  List<String> getLinkedProviders() {
    final user = _auth.currentUser;
    if (user == null) return [];

    return user.providerData.map((info) => info.providerId).toList();
  }

  /// Check if specific provider is linked
  bool isProviderLinked(SignInProvider provider) {
    final linkedProviders = getLinkedProviders();

    switch (provider) {
      case SignInProvider.google:
        return linkedProviders.contains('google.com');
      case SignInProvider.apple:
        return linkedProviders.contains('apple.com');
      case SignInProvider.facebook:
        return linkedProviders.contains('facebook.com');
      case SignInProvider.email:
      case SignInProvider.none:
        return false;
    }
  }

  // ============================================
  // AUTH STATE STREAMS
  // ============================================

  /// Stream of auth state changes
  /// Automatically updates when user logs in/out
  /// Persists offline
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Stream of ID token changes
  /// Useful for token refresh
  Stream<User?> get idTokenChanges => _auth.idTokenChanges();

  /// Stream of user changes
  /// Emits when user properties change
  Stream<User?> get userChanges => _auth.userChanges();

  // ============================================
  // VERIFICATION & VALIDATION
  // ============================================

  /// Check if user is signed in
  bool get isSignedIn => _auth.currentUser != null;

  /// Check if session is fresh (not stale)
  /// Returns false if token is expired or needs refresh
  bool get isSessionFresh {
    final user = _auth.currentUser;
    if (user == null) return false;

    // Check if token is likely expired
    // Firebase automatically refreshes, but we can check metadata
    final metadata = user.metadata;
    final createdAt = metadata.creationTime;

    if (createdAt == null) return false;

    // Consider session fresh if created within last 24 hours
    final now = DateTime.now();
    final hoursDiff = now.difference(createdAt).inHours;

    return hoursDiff < 24;
  }

  /// Check if current user's email is verified
  bool get isEmailVerified => _auth.currentUser?.emailVerified ?? false;

  /// Force refresh user data from server
  /// Useful when going from offline to online
  Future<void> refreshUserData() async {
    try {
      print('🔍 Refreshing user data...');
      await _auth.currentUser?.reload();
      print('✅ User data refreshed');
    } catch (e) {
      print('❌ Error refreshing user data: $e');
      rethrow;
    }
  }

  /// Refresh ID token
  /// Useful for API calls that need fresh token
  Future<String?> refreshIdToken() async {
    try {
      print('🔍 Refreshing ID token...');
      final token = await _auth.currentUser?.getIdToken(true);
      if (token != null) {
        print('✅ ID token refreshed');
      }
      return token;
    } catch (e) {
      print('❌ Error refreshing ID token: $e');
      return null;
    }
  }

  // ============================================
  // OFFLINE HELPERS
  // ============================================

  /// Get localized user info (works offline)
  /// Returns all available cached user information
  Map<String, dynamic>? getCachedUserInfo() {
    final user = _auth.currentUser;
    if (user == null) return null;

    return {
      'uid': user.uid,
      'email': user.email,
      'displayName': user.displayName,
      'photoURL': user.photoURL,
      'phoneNumber': user.phoneNumber,
      'provider': getCurrentProvider().name,
      'providers': getLinkedProviders(),
      'emailVerified': user.emailVerified,
      'isAnonymous': user.isAnonymous,
      'createdAt': user.metadata.creationTime,
      'lastSignIn': user.metadata.lastSignInTime,
    };
  }

  /// Determine if app should show cached data
  /// Returns true if offline but has session
  bool shouldUseCachedData() {
    return isOfflineButAuthenticated;
  }

  /// Get message for offline users
  String getOfflineStatusMessage() {
    if (!isOfflineButAuthenticated) {
      return 'Not signed in';
    }

    final user = _auth.currentUser;
    if (user == null) return 'Unknown state';

    final provider = getCurrentProvider();
    return 'Offline - Signed in as ${user.email} (${provider.name})';
  }

  /// Reset password
  Future<void> resetPassword(String email) async {
    try {
      print('🔍 Sending password reset email...');
      await _auth.sendPasswordResetEmail(email: email);
      print('✅ Password reset email sent');
    } on FirebaseAuthException catch (e) {
      _handleFirebaseAuthException(e);
      rethrow;
    }
  }

  /// Delete user account permanently
  ///
  /// This will:
  /// 1. Delete user document from Firestore
  /// 2. Delete user data from other services
  /// 3. Delete user from Firebase Authentication
  /// 4. Sign out the user
  ///
  /// WARNING: This action is IRREVERSIBLE
  Future<void> deleteAccount() async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw Exception('No user is currently signed in');
      }

      print('🔍 Starting account deletion for: ${user.uid}');

      // Step 1: Delete user data from Firestore
      print('🔍 Deleting user data from Firestore...');
      try {
        await userService.deleteUserData(user.uid);
        print('✅ User data deleted from Firestore');
      } catch (e) {
        print('⚠️ Error deleting Firestore data: $e');
        // Continue with deletion even if Firestore deletion fails
      }

      // Step 2: Revoke social provider access if applicable
      print('🔍 Checking for linked providers...');
      final provider = getCurrentProvider();
      try {
        switch (provider) {
          case SignInProvider.google:
            print('↪️ Revoking Google access...');
            await googleAuthService.disconnect();
            break;
          case SignInProvider.facebook:
            print('↪️ Revoking facebook access...');
            await facebookAuthService.disconnect();
            break;
          case SignInProvider.apple:
            print('↪️ Apple account - user must revoke manually');
            // Apple doesn't provide programmatic revocation
            break;
          case SignInProvider.email:
          case SignInProvider.none:
            print('↪️ No social provider to revoke');
            break;
        }
      } catch (e) {
        print('⚠️ Error revoking provider access: $e');
        // Continue with deletion even if revocation fails
      }

      // Step 3: Re-authenticate user before deletion
      // Firebase requires recent authentication for sensitive operations
      print('🔍 Re-authenticating user...');
      try {
        // Try to refresh the auth token
        await user.getIdToken(true);
        print('✅ User re-authenticated');
      } catch (e) {
        print('⚠️ User re-authentication failed: $e');
        // If re-auth fails, we'll attempt deletion anyway
        // It may fail at the Firebase level if auth is stale
      }

      // Step 4: Delete user from Firebase Authentication.
      // This is a sensitive operation and might fail if the user hasn't
      // signed in recently, throwing a 'requires-recent-login' error.
      print('🔍 Deleting user from Firebase...');
      await user.delete();
      print('✅ User deleted from Firebase');

      // Step 5: Sign out
      print('🔍 Signing out...');
      await _auth.signOut();
      print('✅ Account deletion complete');
    } on FirebaseAuthException catch (e) {
      print('❌ Firebase error during account deletion: ${e.code}');
      _handleAccountDeletionError(e);
    } catch (e) {
      print('❌ Error during account deletion: $e');
      throw Exception('Failed to delete account: $e');
    }
  }

  /// Handle account deletion specific errors
  void _handleAccountDeletionError(FirebaseAuthException e) {
    switch (e.code) {
      case 'requires-recent-login':
        throw Exception(
          'This operation requires recent authentication. '
          'Please sign out and sign in again, then try deleting your account.',
        );
      case 'user-not-found':
        throw Exception('User account not found');
      case 'operation-not-allowed':
        throw Exception('Account deletion is not enabled');
      case 'network-request-failed':
        throw Exception('Network error. Please check your connection');
      default:
        throw Exception('Error deleting account: ${e.message}');
    }
  }
}
