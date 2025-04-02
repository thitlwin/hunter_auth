import 'package:joy_app/src/core/utils/failure.dart';
import 'package:joy_app/src/feature/hunter_auth/domain/model/auth_user.dart';
import 'package:fpdart/fpdart.dart';

abstract class IHunterAuthRepository {
  Future<Either<Failure, AuthUser>> getHunterAuth();
  Future<AuthUser> loginWithGoogle();
  Future<void> logOut();
}
