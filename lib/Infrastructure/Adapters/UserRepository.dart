import 'package:upcpro_app/Domain/Entities/AuthResult.dart';
import 'package:upcpro_app/Domain/Entities/UserEntity.dart';
import 'package:upcpro_app/Domain/Ports/IUserRepository.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/DataSource/User/AuthDataSource.dart';

class UserRepository implements IUserRepository{

  final IAuthDataSource authDataSource;

  UserRepository({required this.authDataSource});

  @override
  Future<ResponseEntity<AuthResult>> auth({required String mail, required String password}) {
    return authDataSource.login(mail: mail, password: password);
  }

  @override
  Future<bool> getRanking({required String token, required String userId}) {
    // TODO: implement getRanking
    throw UnimplementedError();
  }

  @override
  Future<String> refreshToken({required String userId}) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  @override
  Future<ResponseEntity<AuthResult>> register({required UserEntity user}) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<bool> updateMail({required String token, required String mail}) {
    // TODO: implement updateMail
    throw UnimplementedError();
  }

  @override
  Future<bool> updatePassword({required String token, required String password}) {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }

  @override
  Future<bool> updatePuntaje({required String token, required double puntaje}) {
    // TODO: implement updatePuntaje
    throw UnimplementedError();
  }

  @override
  Future<bool> updateUser({required String token, required UserEntity user}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

}