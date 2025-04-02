import 'package:joy_app/src/core/utils/failure.dart';
import 'package:joy_app/src/feature/hunter_auth/domain/model/auth_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:joy_app/src/feature/hunter_auth/domain/repository/hunter_auth_repository_interface.dart';
import 'package:joy_app/src/flavors.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hunter_auth_repository.g.dart';

@riverpod
HunterAuthRepository hunterAuthRepository(Ref ref) {
  return HunterAuthRepository();
}

final class HunterAuthRepository implements IHunterAuthRepository {
  HunterAuthRepository()
      : _firebaseAuth = FirebaseAuth.instance,
        _googleSignIn = kIsWeb
            ? GoogleSignIn(
                clientId: F.googleSignInClientId,
              )
            : GoogleSignIn();

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  // bool get isAlreadyLoggedIn => userId != null;

  @override
  Future<Either<Failure, AuthUser>> getHunterAuth() async {
    try {
      final currentUser = _firebaseAuth.currentUser;
      if (currentUser == null) {
        return left(Failure('User not found!'));
      }
      final authUser = AuthUser(
        userId: currentUser.uid,
        email: currentUser.email,
        displayName: currentUser.displayName,
        profilePictureUrl: currentUser.photoURL,
      );
      return Right(authUser);
    } on FirebaseAuthException catch (e) {
      return Left(Failure(e.message ?? 'Unknown authentication error'));
    }
  }

  @override
  Future<AuthUser> loginWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final oauthCredentials = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    try {
      final userCredential =
          await _firebaseAuth.signInWithCredential(oauthCredentials);
      return AuthUser(
          userId: userCredential.user!.uid,
          email: userCredential.user!.email,
          displayName: userCredential.user!.displayName,
          profilePictureUrl: userCredential.user!.photoURL);
    } on FirebaseAuthException catch (e) {
      throw Failure(e.message ?? 'Google sign-in failed');
    } on PlatformException catch (e) {
      throw Failure(e.message ?? 'Platform error during Google sign-in');
    }
  }

  @override
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }
}
