import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:admin_app/src/feature/hunter_auth/domain/model/auth_user.dart';
import 'package:admin_app/src/feature/hunter_auth/domain/repository/constants/firebase_collection_name.dart';
import 'package:admin_app/src/feature/hunter_auth/domain/repository/constants/firebase_field_name.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository.g.dart';

@riverpod
UserRepository myUserRepository(Ref ref) {
  return UserRepository();
}

@immutable
class UserRepository {
  const UserRepository();

  Future<bool> saveUserInfo({
    required UserId userId,
    required String displayName,
    required String? email,
    required String? profilePictureUrl,
  }) async {
    try {
      // first check if we have this user's info from before
      final userInfo = await FirebaseFirestore.instance
          .collection(FirebaseCollectionName.users)
          .where(FirebaseFieldName.userId, isEqualTo: userId)
          .limit(1)
          .get();

      if (userInfo.docs.isNotEmpty) {
        // we already have this user's profile, save the new data instead
        await userInfo.docs.first.reference.update({
          FirebaseFieldName.displayName: displayName,
          FirebaseFieldName.email: email ?? '',
        });
        return true;
      }

      final payload = AuthUser(
        userId: userId,
        displayName: displayName,
        email: email,
        profilePictureUrl: profilePictureUrl,
      );
      await FirebaseFirestore.instance
          .collection(FirebaseCollectionName.users)
          .add(payload.toJson());
      return true;
    } catch (_) {
      return false;
    }
  }
}
