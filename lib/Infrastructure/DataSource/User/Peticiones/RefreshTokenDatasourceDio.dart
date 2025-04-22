import 'package:dio/dio.dart';
import 'package:upcpro_app/Infrastructure/Config/env/env.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/Models/User/UserModel.dart';

class RefreshTokenDataSourceDio {
  final Dio dio;

  RefreshTokenDataSourceDio({required this.dio});

  Future<ResponseEntity<(UserModel, String)>> refreshToken({
    required String userId,
  }) async {
    try {
      final response = await dio.post(
        "$URLBASE/api/auth/refresh-token",
        data: {"userId": userId},
        options: Options(validateStatus: (status) => status! <= 500),
      );

      final Map<String, dynamic> result = response.data;

      if (response.statusCode == 200) {
        var token = result['token'];
        UserModel user = UserModel.fromJson(result['user']);

        return ResponseEntity.singleEntity(
          message: "Token Refrehs",
          entity: (user, token),
        );
      } else {
        return ResponseEntity.error(message: "Error no cuentas con acceso valido");
      }
    } catch (e) {
      return ResponseEntity.error(message: "Error: ${e.toString()}");
    }
  }
}
