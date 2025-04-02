import 'package:joy_app/src/feature/hunter_auth/domain/model/auth_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    required Map<String, String>? formErrors,
    required bool isLoading,
    required bool isSuccess,
    required AuthUser? user,
    required String? message,
  }) = _AuthState;

  factory AuthState.initial() => AuthState(
        formErrors: null,
        isLoading: false,
        isSuccess: false,
        user: null,
        message: null,
      );
}
