// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginScreenState {
  Map<String, String>? get formErrors;
  bool get isLoading;
  bool get isSuccess;
  String? get phone;
  String? get password;
  String? get messageKey;

  /// Create a copy of LoginScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginScreenStateCopyWith<LoginScreenState> get copyWith =>
      _$LoginScreenStateCopyWithImpl<LoginScreenState>(
          this as LoginScreenState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginScreenState &&
            const DeepCollectionEquality()
                .equals(other.formErrors, formErrors) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.messageKey, messageKey) ||
                other.messageKey == messageKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(formErrors),
      isLoading,
      isSuccess,
      phone,
      password,
      messageKey);

  @override
  String toString() {
    return 'LoginScreenState(formErrors: $formErrors, isLoading: $isLoading, isSuccess: $isSuccess, phone: $phone, password: $password, messageKey: $messageKey)';
  }
}

/// @nodoc
abstract mixin class $LoginScreenStateCopyWith<$Res> {
  factory $LoginScreenStateCopyWith(
          LoginScreenState value, $Res Function(LoginScreenState) _then) =
      _$LoginScreenStateCopyWithImpl;
  @useResult
  $Res call(
      {Map<String, String>? formErrors,
      bool isLoading,
      bool isSuccess,
      String? phone,
      String? password,
      String? messageKey});
}

/// @nodoc
class _$LoginScreenStateCopyWithImpl<$Res>
    implements $LoginScreenStateCopyWith<$Res> {
  _$LoginScreenStateCopyWithImpl(this._self, this._then);

  final LoginScreenState _self;
  final $Res Function(LoginScreenState) _then;

  /// Create a copy of LoginScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formErrors = freezed,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? phone = freezed,
    Object? password = freezed,
    Object? messageKey = freezed,
  }) {
    return _then(_self.copyWith(
      formErrors: freezed == formErrors
          ? _self.formErrors
          : formErrors // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _self.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      messageKey: freezed == messageKey
          ? _self.messageKey
          : messageKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _LoginScreenState implements LoginScreenState {
  const _LoginScreenState(
      {required final Map<String, String>? formErrors,
      required this.isLoading,
      required this.isSuccess,
      required this.phone,
      required this.password,
      required this.messageKey})
      : _formErrors = formErrors;

  final Map<String, String>? _formErrors;
  @override
  Map<String, String>? get formErrors {
    final value = _formErrors;
    if (value == null) return null;
    if (_formErrors is EqualUnmodifiableMapView) return _formErrors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final String? phone;
  @override
  final String? password;
  @override
  final String? messageKey;

  /// Create a copy of LoginScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginScreenStateCopyWith<_LoginScreenState> get copyWith =>
      __$LoginScreenStateCopyWithImpl<_LoginScreenState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginScreenState &&
            const DeepCollectionEquality()
                .equals(other._formErrors, _formErrors) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.messageKey, messageKey) ||
                other.messageKey == messageKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_formErrors),
      isLoading,
      isSuccess,
      phone,
      password,
      messageKey);

  @override
  String toString() {
    return 'LoginScreenState(formErrors: $formErrors, isLoading: $isLoading, isSuccess: $isSuccess, phone: $phone, password: $password, messageKey: $messageKey)';
  }
}

/// @nodoc
abstract mixin class _$LoginScreenStateCopyWith<$Res>
    implements $LoginScreenStateCopyWith<$Res> {
  factory _$LoginScreenStateCopyWith(
          _LoginScreenState value, $Res Function(_LoginScreenState) _then) =
      __$LoginScreenStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Map<String, String>? formErrors,
      bool isLoading,
      bool isSuccess,
      String? phone,
      String? password,
      String? messageKey});
}

/// @nodoc
class __$LoginScreenStateCopyWithImpl<$Res>
    implements _$LoginScreenStateCopyWith<$Res> {
  __$LoginScreenStateCopyWithImpl(this._self, this._then);

  final _LoginScreenState _self;
  final $Res Function(_LoginScreenState) _then;

  /// Create a copy of LoginScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? formErrors = freezed,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? phone = freezed,
    Object? password = freezed,
    Object? messageKey = freezed,
  }) {
    return _then(_LoginScreenState(
      formErrors: freezed == formErrors
          ? _self._formErrors
          : formErrors // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _self.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      messageKey: freezed == messageKey
          ? _self.messageKey
          : messageKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
