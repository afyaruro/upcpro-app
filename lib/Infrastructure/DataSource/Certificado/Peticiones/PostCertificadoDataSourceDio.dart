import 'package:dio/dio.dart';
import 'package:upcpro_app/Infrastructure/Config/env/env.dart';
import 'package:upcpro_app/Infrastructure/Models/Certificado/CertificadoModel.dart';

class PostCertificadoDataSourceDio {
  final Dio dio;

  PostCertificadoDataSourceDio({required this.dio});

  Future<bool> agregarCertificado({
    required CertificadoModel certificado,
    required String token,
  }) async {
    try {
      final response = await dio.post(
        "$URLBASE/api/certificado/createl",
        data: {certificado.toJsonCertificadoDio()},
        options: Options(
          validateStatus: (status) => status! <= 500,
          headers: {
            "accept": "*/*",
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
      );

      final Map<String, dynamic> result = response.data;

      if (response.statusCode == 201) {
        return result['success'];
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
