import 'package:dio/dio.dart';
import 'package:upcpro_app/Domain/Ports/User/IUserRepository.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/DataSource/User/LocalBD/SaveUserDatasourceHive.dart';
import 'package:upcpro_app/Infrastructure/DataSource/User/LocalBD/GetUserDataSourceHive.dart';
import 'package:upcpro_app/Infrastructure/DataSource/User/Peticiones/LoginDatasourceDio.dart';
import 'package:upcpro_app/Infrastructure/DataSource/User/Peticiones/RefreshTokenDatasourceDio.dart';
import 'package:upcpro_app/Infrastructure/DataSource/User/Peticiones/SignUpDataSource.dart';
import 'package:upcpro_app/Infrastructure/Models/User/UserModel.dart';

class UserRepository implements IUserRepository {
  final Dio dio;

  UserRepository({required this.dio});

  @override
  Future<ResponseEntity<(UserModel, String)>> authDio({
    required String mail,
    required String password,
  }) async {
    return await LoginDataSourceDio(
      dio: dio,
    ).login(mail: mail, password: password);
  }

  @override
  Future<ResponseEntity<(UserModel, String)>> getUserHive() async {
    return await GetUserDataSourceHive().getUserHive();
  }

  @override
  Future<ResponseEntity<(UserModel, String)>> refreshTokenDio({
    required String userId,
  }) async {
    return await RefreshTokenDataSourceDio(
      dio: dio,
    ).refreshToken(userId: userId);
  }

  @override
  Future<bool> saveUserHive(UserModel user, String token) async {
    return await SaveUserDataSourceHive().saveUser(user, token);
  }

  @override
  Future<ResponseEntity<(UserModel, String)>> createUserDio({
    required UserModel user,
    required String password,
  }) async {
    return await SignUpDataSourceDio(
      dio: dio,
    ).signUp(password: password, user: user);
  }
}
