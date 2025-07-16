import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_screen_state.freezed.dart';

@freezed
abstract class LoginScreenState with _$LoginScreenState {
  const factory LoginScreenState({
    required Map<String, String>? formErrors,
    required bool isLoading,
    required bool isSuccess,
    required String? phone,
    required String? password,
    required String? messageKey,
  }) = _LoginScreenState;

  factory LoginScreenState.initial() => LoginScreenState(
        formErrors: null,
        isLoading: false,
        isSuccess: false,
        messageKey: null,
        phone: null,
        password: null,
      );
}
