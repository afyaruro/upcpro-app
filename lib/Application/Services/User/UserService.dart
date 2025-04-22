import 'package:upcpro_app/Domain/Entities/User/UserEntity.dart';
import 'package:upcpro_app/Domain/Ports/User/IUserRepository.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/Models/User/UserModel.dart';

class UserService {
  final IUserRepository repository;

  UserService({required this.repository});

  Future<ResponseEntity<(UserModel, String)>> auth({
    required String mail,
    required String password,
  }) async {
    var resp = await repository.authDio(mail: mail, password: password);

    if (resp.isError!) {
      return resp;
    } else {
      var (user, token) = resp.entity!;
      bool respSave = await repository.saveUserHive(user, token);
      if (!respSave) {
        return ResponseEntity.error(message: "Error al guardar en local");
      }

      return resp;
    }
  }

  Future<ResponseEntity<(UserModel, String)>> refreshToken({
    required String userId,
  }) async {
    var resp = await repository.refreshTokenDio(userId: userId);

    if (!resp.isError!) {
      var (user, token) = resp.entity!;
      bool respSave = await repository.saveUserHive(user, token);
      if (!respSave) {
        return ResponseEntity.error(message: "Error al guardar en local");
      }
    }

    return resp;
  }

  Future<ResponseEntity<(UserModel, String)>> obtenerUserLocal() async {
    return await repository.getUserHive();
  }

  Future<ResponseEntity<(UserModel, String)>> createUserDio({
    required UserEntity user,
  }) async {
    var resp = await repository.createUserDio(
      user: user.toUserModel(),
      password: user.password!,
    );

    if (resp.isError!) {
      return resp;
    } else {
      var (user, token) = resp.entity!;
      bool respSave = await repository.saveUserHive(user, token);
      if (!respSave) {
        return ResponseEntity.error(message: "Error al crear el usuario");
      }
    }

    return resp;
  }
}
