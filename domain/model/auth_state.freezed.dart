// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthState {
  Map<String, String>? get formErrors;
  bool get isLoading;
  bool get isSuccess;
  AuthUser? get user;
  String? get message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthStateCopyWith<AuthState> get copyWith =>
      _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthState &&
            const DeepCollectionEquality()
                .equals(other.formErrors, formErrors) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(formErrors),
      isLoading,
      isSuccess,
      user,
      message);

  @override
  String toString() {
    return 'AuthState(formErrors: $formErrors, isLoading: $isLoading, isSuccess: $isSuccess, user: $user, message: $message)';
  }
}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) =
      _$AuthStateCopyWithImpl;
  @useResult
  $Res call(
      {Map<String, String>? formErrors,
      bool isLoading,
      bool isSuccess,
      AuthUser? user,
      String? message});

  $AuthUserCopyWith<$Res>? get user;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._self, this._then);

  final AuthState _self;
  final $Res Function(AuthState) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formErrors = freezed,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? user = freezed,
    Object? message = freezed,
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
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as AuthUser?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthUserCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $AuthUserCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// @nodoc

class _AuthState implements AuthState {
  const _AuthState(
      {required final Map<String, String>? formErrors,
      required this.isLoading,
      required this.isSuccess,
      required this.user,
      required this.message})
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
  final AuthUser? user;
  @override
  final String? message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthState &&
            const DeepCollectionEquality()
                .equals(other._formErrors, _formErrors) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_formErrors),
      isLoading,
      isSuccess,
      user,
      message);

  @override
  String toString() {
    return 'AuthState(formErrors: $formErrors, isLoading: $isLoading, isSuccess: $isSuccess, user: $user, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$AuthStateCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(
          _AuthState value, $Res Function(_AuthState) _then) =
      __$AuthStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Map<String, String>? formErrors,
      bool isLoading,
      bool isSuccess,
      AuthUser? user,
      String? message});

  @override
  $AuthUserCopyWith<$Res>? get user;
}

/// @nodoc
class __$AuthStateCopyWithImpl<$Res> implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(this._self, this._then);

  final _AuthState _self;
  final $Res Function(_AuthState) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? formErrors = freezed,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? user = freezed,
    Object? message = freezed,
  }) {
    return _then(_AuthState(
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
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as AuthUser?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthUserCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $AuthUserCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

// dart format on
