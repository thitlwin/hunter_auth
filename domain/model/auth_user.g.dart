// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthUser _$AuthUserFromJson(Map<String, dynamic> json) => _AuthUser(
      userId: json['userId'] as String,
      displayName: json['displayName'] as String?,
      email: json['email'] as String?,
      profilePictureUrl: json['profilePictureUrl'] as String?,
    );

Map<String, dynamic> _$AuthUserToJson(_AuthUser instance) => <String, dynamic>{
      'userId': instance.userId,
      'displayName': instance.displayName,
      'email': instance.email,
      'profilePictureUrl': instance.profilePictureUrl,
    };
