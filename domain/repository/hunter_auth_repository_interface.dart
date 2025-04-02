import 'package:admin_app/src/feature/hunter_auth/domain/model/auth_user.dart';
import 'package:admin_app/src/feature/monks/domain/model/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class IHunterAuthRepository {
  Future<Either<Failure, AuthUser>> getHunterAuth();
  Future<AuthUser> loginWithGoogle();
  Future<void> logOut();
}
