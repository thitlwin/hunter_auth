import 'package:joy_app/src/feature/hunter_auth/domain/model/auth_user.dart';
import 'package:joy_app/src/feature/hunter_auth/data/repository/hunter_auth_repository.dart';
import 'package:joy_app/src/feature/hunter_auth/domain/model/auth_state.dart';
import 'package:joy_app/src/feature/hunter_auth/domain/repository/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hunter_auth_provider.g.dart';

@riverpod
class HunterAuth extends _$HunterAuth {
  @override
  AuthState build() {
    _initializeUser();
    return AuthState.initial();
  }

  Future<void> logOut() async {
    final authRepository = ref.read(hunterAuthRepositoryProvider);
    state = state.copyWith(isLoading: true);
    await authRepository.logOut();
    state = state.copyWith(isLoading: false, user: null);
  }

  Future<void> loginWithGoogle() async {
    final authRepository = ref.read(hunterAuthRepositoryProvider);
    state = state.copyWith(isLoading: true);
    final result = await authRepository.loginWithGoogle();
    if (result != null) {
      await saveUserInfo(user: result);
    }
    state = state.copyWith(isLoading: false, user: result);
  }

  Future<void> saveUserInfo({required AuthUser user}) async {
    final userRepository = ref.read(myUserRepositoryProvider);

    userRepository.saveUserInfo(
      userId: user.userId,
      displayName: user.displayName ?? '',
      email: user.email,
      profilePictureUrl: user.profilePictureUrl,
    );
  }

  Future<void> _initializeUser() async {
    final authRepository = ref.read(hunterAuthRepositoryProvider);
    final result = await authRepository.getHunterAuth();
    result.fold(
      (failure) => state = state.copyWith(isLoading: false),
      (user) => state = state.copyWith(isLoading: false, user: user),
    );
  }
}
