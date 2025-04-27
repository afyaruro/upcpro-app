import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:upcpro_app/Domain/Ports/Certificado/ICertificadoRepository.dart';
import 'package:upcpro_app/Infrastructure/DataSource/Certificado/LocalDB/GetSimulacroActualDataSourceHive.dart';
import 'package:upcpro_app/Infrastructure/DataSource/Certificado/LocalDB/SaveSimulacroActualDatasourceHive.dart';
import 'package:upcpro_app/Infrastructure/DataSource/Certificado/Peticiones/PostCertificadoDataSourceDio.dart';
import 'package:upcpro_app/Infrastructure/Models/Certificado/CertificadoModel.dart';

class CertificadoRepository implements ICertificadoRepository {
  final Dio dio;

  CertificadoRepository({required this.dio});

  @override
  Future<bool> saveCertificadoHive(
    CertificadoModel simulacroActivo,
    Box box,
  ) async {
    return await SaveSimulacroActualDataSourceHive().saveSimulacroActual(
      simulacroActivo,
      box,
    );
  }

  @override
  Future<CertificadoModel?> getSimulacroActivo(Box box) async {
    return await GetSimulacroActiveDataSourceHive().getSimulacroActivo(box);
  }

  @override
  Future<bool> saveCertificadoDio(CertificadoModel certificado, String token) {
    return PostCertificadoDataSourceDio(
      dio: dio,
    ).agregarCertificado(certificado: certificado, token: token);
  }

  @override
  Future<bool> saveCertificadoTerminado(CertificadoModel certificado, Box box) {
    // TODO: implement saveCertificadoTerminado
    throw UnimplementedError();
  }
}
