import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:joy_app/src/feature/login/util/apple_auth_service.dart';
import 'package:joy_app/src/feature/login/util/auth_service.dart';
import 'package:joy_app/src/feature/login/util/facebook_auth_service.dart';
import 'package:joy_app/src/feature/login/util/google_auth_service.dart';
import 'package:joy_app/src/feature/login/util/user_service.dart';

/// Google Auth Service provider
final facebookAuthServiceProvider = Provider<FacebookAuthService>((ref) {
  return FacebookAuthService();
});

/// Google Auth Service provider
final googleAuthServiceProvider = Provider<GoogleAuthService>((ref) {
  return GoogleAuthService();
});

/// Apple Auth Service provider
final appleAuthServiceProvider = Provider<AppleAuthService>((ref) {
  return AppleAuthService();
});

/// User Service provider (for Firestore operations)
final userServiceProvider = Provider<UserService>((ref) {
  return UserService();
});

/// Unified Auth Service provider
final authServiceProvider = Provider<AuthService>((ref) {
  // AuthService depends on other services
  final googleAuth = ref.watch(googleAuthServiceProvider);
  final appleAuth = ref.watch(appleAuthServiceProvider);
  final userService = ref.watch(userServiceProvider);

  return AuthService(
      googleAuthService: googleAuth,
      appleAuthService: appleAuth,
      userService: userService,
      facebookAuthService: ref.watch(facebookAuthServiceProvider));
});
