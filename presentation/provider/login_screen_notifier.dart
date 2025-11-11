import 'package:firebase_auth/firebase_auth.dart';
import 'package:joy_app/src/core/utils/failure.dart';
import 'package:joy_app/src/feature/authentication/data/repository/hunter_auth_repository.dart';
import 'package:joy_app/src/feature/login/domain/model/login_screen_state.dart';
import 'package:joy_app/src/feature/authentication/presentation/provider/hunter_auth_notifier.dart';
import 'package:joy_app/l10n/l10n_constants.dart';
import 'package:joy_app/src/feature/login/presentation/provider/auth_providers.dart';
import 'package:joy_app/src/feature/login/util/auth_service.dart';
import 'package:joy_app/src/feature/profile/domain/model/profile_mappers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

part 'login_screen_notifier.g.dart';

@riverpod
class LoginScreenNotifier extends _$LoginScreenNotifier {
  @override
  Future<LoginScreenState> build() async {
    final isAvailable = await SignInWithApple.isAvailable();
    return Future.value(LoginScreenState.initial()
        .copyWith(isAppleSignInAvailable: isAvailable));
  }

  Future<void> login(String phone, String password) async {
    final currentState = state.value ?? LoginScreenState.initial();
    state = AsyncValue.data(
        currentState.copyWith(phone: phone, password: password));
    final errors = validateAllFields();
    if (errors.isNotEmpty) {
      state = AsyncValue.data(currentState.copyWith(
        formErrors: errors,
        isLoading: false,
        messageKey: L10nConstants.errorFillInAllFields,
        isSuccess: false,
      ));
      return;
    }

    final authRepository = ref.read(hunterAuthRepositoryProvider);
    state = AsyncValue.data(
        currentState.copyWith(isLoading: true, messageKey: null));
    final result = await authRepository.login(phone, password);
    result.fold((left) {
      _handleErrorState(left);
    }, (right) async {
      final authNotifier = ref.read(hunterAuthNotifierProvider.notifier);
      await authNotifier.setAuthUser(right.data.toAuthDomainModel());
      state = AsyncValue.data(currentState.copyWith(
        isLoading: false,
        messageKey: L10nConstants.successLogin,
        isSuccess: true,
      ));
    });
  }

  void _handleErrorState(Failure left) {
    final currentState = state.value ?? LoginScreenState.initial();
    final message = left.errorMessage;
    state = AsyncValue.data(currentState.copyWith(
      isLoading: false,
      messageKey: message,
      isSuccess: false,
    ));
  }

  void updatePhoneNumber(String phone) {
    final currentState = state.value ?? LoginScreenState.initial();
    state =
        AsyncValue.data(currentState.copyWith(formErrors: null, phone: phone));
    validateField(L10nConstants.phone,
        phone.isEmpty ? L10nConstants.errorPhoneRequired : null);
  }

  void updatePassword(String password) {
    final currentState = state.value ?? LoginScreenState.initial();
    state = AsyncValue.data(
        currentState.copyWith(formErrors: null, password: password));
    validateField(L10nConstants.password,
        password.isEmpty ? L10nConstants.errorPasswordRequired : null);
  }

  void validateField(String field, String? errorKey) {
    final currentState = state.value ?? LoginScreenState.initial();
    final newErrors = Map<String, String>.from(currentState.formErrors ?? {});
    if (errorKey != null) {
      newErrors[field] = errorKey;
    } else {
      newErrors.remove(field);
    }
    state = AsyncValue.data(currentState.copyWith(
      formErrors: newErrors,
    ));
  }

  Map<String, String> validateAllFields() {
    final errors = <String, String>{};
    final currentState = state.value ?? LoginScreenState.initial();
    if (currentState.phone == null || currentState.phone?.isEmpty == true) {
      errors[L10nConstants.phone] = L10nConstants.errorPhoneRequired;
    }
    if (currentState.password == null ||
        currentState.password?.isEmpty == true) {
      errors[L10nConstants.password] = L10nConstants.errorPasswordRequired;
    }
    return errors;
  }

  Future<void> loginWithFacebook() async {
    final currentState = state.value ?? LoginScreenState.initial();
    state = AsyncValue.data(
        currentState.copyWith(isLoading: true, messageKey: null));
    try {
      final authService = ref.watch(authServiceProvider);
      final userCredential = await authService.signInWithFacebook();
      if (userCredential != null) {
        // Use the access token to log in to your backend.
        await _doBackendLogin(
            userCredential.credential!.accessToken!, SignInProvider.facebook);
      } else {
        // Handle login cancellation by the user.
        _handleErrorState(
            Failure.unexpectedError(L10nConstants.errorFacebookLoginCancelled));
      }
    } on AuthError catch (e) {
      _handleErrorState(e);
    } catch (e) {
      // Handle other errors (e.g., from Facebook SDK or network issues).
      _handleErrorState(
          Failure.unexpectedError(L10nConstants.errorSomethingWentWrong));
    }
  }

  Future<void> _doBackendLogin(
      String accessToken, SignInProvider signInProvider) async {
    final currentState = state.value ?? LoginScreenState.initial();
    final authRepository = ref.read(hunterAuthRepositoryProvider);

    // return a LoginResponse, just like the regular login.
    final result =
        await authRepository.socialLogin(accessToken, signInProvider);
    result.fold(
      (left) => _handleErrorState(left),
      (right) {
        final authNotifier = ref.read(hunterAuthNotifierProvider.notifier);
        authNotifier.setAuthUser(right.data.toAuthDomainModel());
        state = AsyncValue.data(currentState.copyWith(
          isLoading: false,
          messageKey: L10nConstants.successLogin,
          isSuccess: true,
        ));
      },
    );
  }

  Future<void> loginWithApple() async {
    final currentState = state.value ?? LoginScreenState.initial();
    state = AsyncValue.data(
        currentState.copyWith(isLoading: true, messageKey: null));
    try {
      final authService = ref.watch(authServiceProvider);
      final userCredential = await authService.signInWithApple();

      if (userCredential != null) {
        await _doBackendLogin(
            userCredential.credential!.accessToken!, SignInProvider.apple);
      } else {
        // Handle login cancellation by the user.
        _handleErrorState(
            Failure.unexpectedError(L10nConstants.errorAppleLoginCancelled));
      }
    } on SignInWithAppleAuthorizationException catch (e) {
      // Handle user cancellation or other Apple-specific errors
      if (e.code != AuthorizationErrorCode.canceled) {
        _handleErrorState(Failure.unexpectedError(e.message));
      }
      state = AsyncValue.data(currentState.copyWith(isLoading: false));
    } on AuthError catch (e) {
      _handleErrorState(e);
    } catch (e) {
      _handleErrorState(
          Failure.unexpectedError(L10nConstants.errorSomethingWentWrong));
    }
  }

  Future<void> loginWithGoogle() async {
    final currentState = state.value ?? LoginScreenState.initial();
    state = AsyncValue.data(
        currentState.copyWith(isLoading: true, messageKey: null));
    try {
      final authService = ref.watch(authServiceProvider);
      final userCredential = await authService.signInWithGoogle();

      if (userCredential != null) {
        await _doBackendLogin(
            userCredential.credential!.accessToken!, SignInProvider.google);
      } else {
        // Handle login cancellation by the user.
        _handleErrorState(
            Failure.unexpectedError(L10nConstants.errorGoogleLoginCancelled));
      }
    } on AuthError catch (e) {
      _handleErrorState(e);
    } catch (e) {
      _handleErrorState(
          Failure.unexpectedError(L10nConstants.errorSomethingWentWrong));
    }
  }
}
