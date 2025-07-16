import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:joy_app/src/core/utils/failure.dart';
import 'package:joy_app/src/feature/login/data/model/login_response.dart';
import 'package:joy_app/src/feature/authentication/data/repository/hunter_auth_repository.dart';
import 'package:joy_app/src/feature/login/domain/model/login_screen_state.dart';
import 'package:joy_app/src/feature/authentication/presentation/provider/hunter_auth_provider.dart';
import 'package:joy_app/l10n/l10n_constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_screen_notifier.g.dart';

@riverpod
class LoginScreenNotifier extends _$LoginScreenNotifier {
  @override
  LoginScreenState build() {
    return LoginScreenState.initial();
  }

  Future<void> login(String phone, String password) async {
    state = state.copyWith(phone: phone, password: password);
    final errors = validateAllFields();
    if (errors.isNotEmpty) {
      state = state.copyWith(
        formErrors: errors,
        isLoading: false,
        messageKey: L10nConstants.errorFillInAllFields,
        isSuccess: false,
      );
      return;
    }

    final authRepository = ref.read(hunterAuthRepositoryProvider);
    state = state.copyWith(isLoading: true, messageKey: null);
    final result = await authRepository.login(phone, password);

    result.fold((left) {
      _handleErrorState(left);
    }, (right) {
      final authNotifier = ref.read(hunterAuthProvider.notifier);
      authNotifier.setAuthUser(right.toAuthDomainModel());
      state = state.copyWith(
        isLoading: false,
        messageKey: L10nConstants.successLogin,
        isSuccess: true,
      );
    });
  }

  void _handleErrorState(Failure left) {
    final message = left.errorMessage;
    state = state.copyWith(
      isLoading: false,
      messageKey: message,
      isSuccess: false,
    );
  }

  void updatePhoneNumber(String phone) {
    state = state.copyWith(formErrors: null, phone: phone);
    validateField(L10nConstants.phone,
        phone.isEmpty ? L10nConstants.errorPhoneRequired : null);
  }

  void updatePassword(String password) {
    state = state.copyWith(formErrors: null, password: password);
    validateField(L10nConstants.password,
        password.isEmpty ? L10nConstants.errorPasswordRequired : null);
  }

  void validateField(String field, String? errorKey) {
    final newErrors = Map<String, String>.from(state.formErrors ?? {});
    if (errorKey != null) {
      newErrors[field] = errorKey;
    } else {
      newErrors.remove(field);
    }
    state = state.copyWith(
      formErrors: newErrors,
    );
  }

  Map<String, String> validateAllFields() {
    final errors = <String, String>{};

    if (state.phone == null || state.phone?.isEmpty == true) {
      errors[L10nConstants.phone] = L10nConstants.errorPhoneRequired;
    }
    if (state.password == null || state.password?.isEmpty == true) {
      errors[L10nConstants.password] = L10nConstants.errorPasswordRequired;
    }
    return errors;
  }

// https://joy-develop-prj.firebaseapp.com/__/auth/handler
  Future<void> loginWithFacebook() async {
    state = state.copyWith(isLoading: true, messageKey: null);
    try {
      // 1. Use the Facebook SDK to get an access token.
      final loginResult = await FacebookAuth.instance.login(
        permissions: ['public_profile', 'email'],
      );

      if (loginResult.status == LoginStatus.success) {
        // 2. Create a credential for Firebase from the access token.
        final credential = FacebookAuthProvider.credential(
            loginResult.accessToken!.tokenString);

        // 3. Sign in to Firebase.
        final userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        // 4. If sign-in is successful, we sync with our own backend via the repository.
        // This keeps our app's user model consistent.
        if (userCredential.user != null) {
          final authRepository = ref.read(hunterAuthRepositoryProvider);
          // This assumes a method `loginWithFirebaseUser` exists in the repository.
          // It would take the Firebase user, sync it with the backend,
          // and return a LoginResponse, just like the regular login.
          final result =
              await authRepository.loginWithFirebaseUser(userCredential.user!);
          result.fold(
            (left) => _handleErrorState(left),
            (right) {
              // final authNotifier = ref.read(hunterAuthProvider.notifier);
              // authNotifier.setAuthUser(right.toAuthDomainModel());
              state = state.copyWith(
                isLoading: false,
                messageKey: L10nConstants.successLogin,
                isSuccess: true,
              );
            },
          );
        } else {
          _handleErrorState(
              Failure.unexpectedError(L10nConstants.errorSomethingWentWrong));
        }
      } else {
        // Handle login cancellation by the user.
        _handleErrorState(
            Failure.unexpectedError(L10nConstants.errorFacebookLoginCancelled));
      }
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase errors, e.g., account-exists-with-different-credential
      _handleErrorState(Failure.unexpectedError(
          e.message ?? L10nConstants.errorSomethingWentWrong));
    } catch (e) {
      // Handle other errors (e.g., from Facebook SDK, network issues).
      _handleErrorState(
          Failure.unexpectedError(L10nConstants.errorSomethingWentWrong));
    }
  }
}
