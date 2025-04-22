import 'package:dio/dio.dart';
import 'package:upcpro_app/Infrastructure/Config/env/env.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/Models/User/UserModel.dart';

class LoginDataSourceDio {
  final Dio dio;

  LoginDataSourceDio({required this.dio});

  Future<ResponseEntity<(UserModel, String)>> login({
    required String mail,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        "$URLBASE/api/auth/login",
        data: {"mail": mail, "password": password},
        options: Options(validateStatus: (status) => status! <= 500),
      );

      final Map<String, dynamic> result = response.data;

      if (response.statusCode == 200) {
        var user = UserModel.fromJson(result['data']);
        var token = result['token'];

        return ResponseEntity.singleEntity(
          message: result['message'],
          entity: (user, token),
        );
      } else {
        return ResponseEntity.error(message: result['message']);
      }
    } catch (e) {
      return ResponseEntity.error(message: "Error: ${e.toString()}");
    }
  }
}
