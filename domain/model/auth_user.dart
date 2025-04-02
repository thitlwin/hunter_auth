import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.freezed.dart';
part 'auth_user.g.dart';

typedef UserId = String;

@freezed
abstract class AuthUser with _$AuthUser {
  const factory AuthUser({
    required UserId userId,
    required String? displayName,
    required String? email,
    required String? profilePictureUrl,
  }) = _AuthUser;

  factory AuthUser.fromJson(Map<String, dynamic> json) =>
      _$AuthUserFromJson(json);
}
