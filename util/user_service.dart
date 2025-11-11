import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Create or update user document
  Future<void> saveUserData(User user) async {
    // final userRef = _firestore.collection('users').doc(user.uid);

    // final docSnapshot = await userRef.get();

    // if (!docSnapshot.exists) {
    //   // Create new user document
    //   await userRef.set({
    //     'uid': user.uid,
    //     'email': user.email,
    //     'displayName': user.displayName,
    //     'photoURL': user.photoURL,
    //     'phoneNumber': user.phoneNumber,
    //     'emailVerified': user.emailVerified,
    //     'provider': 'google.com',
    //     'createdAt': FieldValue.serverTimestamp(),
    //     'lastSignIn': FieldValue.serverTimestamp(),
    //   });
    //   print('✅ New user document created');
    // } else {
    //   // Update existing user document
    //   await userRef.update({
    //     'lastSignIn': FieldValue.serverTimestamp(),
    //     'displayName': user.displayName,
    //     'photoURL': user.photoURL,
    //     'emailVerified': user.emailVerified,
    //   });
    //   print('✅ User document updated');
    // }
  }

  /// Get user data
  Future<Map<String, dynamic>?> getUserData(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();
    return doc.data();
  }

  /// Update user profile
  Future<void> updateUserProfile({
    required String uid,
    String? displayName,
    String? photoURL,
    Map<String, dynamic>? additionalData,
  }) async {
    final updates = <String, dynamic>{
      'updatedAt': FieldValue.serverTimestamp(),
    };

    if (displayName != null) updates['displayName'] = displayName;
    if (photoURL != null) updates['photoURL'] = photoURL;
    if (additionalData != null) updates.addAll(additionalData);

    await _firestore.collection('users').doc(uid).update(updates);
  }

  /// Delete user document and all associated data
  Future<void> deleteUserData(String uid) async {
    try {
      print('🔍 Deleting user document: $uid');
      // Delete main user document
      await _firestore.collection('users').doc(uid).delete();
      print('✅ User document deleted');
    } catch (e) {
      print('❌ Error deleting user data: $e');
      throw Exception('Failed to delete user data: $e');
    }
  }
}
