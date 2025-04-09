import 'package:upcpro_app/Domain/Entities/AuthResult.dart';
import 'package:upcpro_app/Domain/Entities/UserEntity.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';

abstract class IUserRepository {
  Future<ResponseEntity<AuthResult>> auth({
    required String mail,
    required String password,
  });

  Future<ResponseEntity<AuthResult>> register({
    required UserEntity user,
  });

  Future<String> refreshToken({
    required String userId,
  });

  Future<bool> updateUser({
    required String token,
    required UserEntity user,
  });

  Future<bool> updatePassword({
    required String token,
    required String password,
  });

  Future<bool> updateMail({
    required String token,
    required String mail
  });

  Future<bool> getRanking({
    required String token,
    required String userId
  });

  Future<bool> updatePuntaje({
    required String token,
    required double puntaje
  });
}
