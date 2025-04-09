import 'package:dio/dio.dart';
import 'package:upcpro_app/Domain/Entities/AuthResult.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Config/env/UrlBase.dart';
import 'package:upcpro_app/Infrastructure/Models/UserModel.dart';

abstract class IAuthDataSource {
  Future<ResponseEntity<AuthResult>> login({
    required String mail,
    required String password,
  });
}

class AuthDataSource implements IAuthDataSource {
  final Dio dio = Dio();

  @override
  Future<ResponseEntity<AuthResult>> login({
    required String mail,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        "$URLBASE/auth/login",
        data: {"mail": mail, "password": password},
        options: Options(validateStatus: (status) => status! < 500),
      );

      final Map<String, dynamic> result = response.data;

      if (response.statusCode == 200) {
        var user = UserModel.fromJson(result['data']);
        var token = result['token'];

        var authResult = AuthResult(user: user.toEntity(), token: token);

        return ResponseEntity.singleEntity(
          message: result['message'],
          entity: authResult,
        );
      } else {
        return ResponseEntity.error(message: result['message']);
      }
    } catch (e) {
      return ResponseEntity.error(message: "Error: ${e.toString()}");
    }
  }
}
