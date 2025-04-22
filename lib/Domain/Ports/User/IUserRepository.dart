
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/Models/User/UserModel.dart';

abstract class IUserRepository {
  Future<ResponseEntity<(UserModel, String)>> authDio({
    required String mail,
    required String password,
  });

  Future<ResponseEntity<(UserModel, String)>> refreshTokenDio({
    required String userId,
  });

  Future<ResponseEntity<(UserModel, String)>> createUserDio({required UserModel user, required String password});

  Future<ResponseEntity<(UserModel, String)>> getUserHive();

  Future<bool> saveUserHive(UserModel user, String token);


}
