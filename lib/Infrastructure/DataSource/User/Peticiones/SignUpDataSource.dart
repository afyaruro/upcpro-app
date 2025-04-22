import 'package:dio/dio.dart';
import 'package:upcpro_app/Infrastructure/Config/env/env.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/Models/User/UserModel.dart';

class SignUpDataSourceDio {
  final Dio dio;

  SignUpDataSourceDio({required this.dio});

  Future<ResponseEntity<(UserModel, String)>> signUp({
    required String password,
    required UserModel user,
  }) async {
    try {
      final response = await dio.post(
        "$URLBASE/api/user/create",
        data: user.toJsonDio(password),
        options: Options(validateStatus: (status) => status! <= 500),
      );

      final Map<String, dynamic> result = response.data;

      if (response.statusCode == 201) {
        var user = UserModel.fromJson(result['data']);
        var token = result['token'];

        return ResponseEntity.singleEntity(
          message: result['message'],
          entity: (user, token),
        );
      } else {
        if (response.statusCode == 401) {
          return ResponseEntity.error(message: "Credenciales no validas");
        }
        
        return ResponseEntity.error(message: result['message']);
      }
    } catch (e) {
      return ResponseEntity.error(message: "Error: ${e.toString()}");
    }
  }
}
