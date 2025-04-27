import 'package:hive/hive.dart';
import 'package:upcpro_app/Infrastructure/Models/Certificado/CertificadoModel.dart';

abstract class ICertificadoRepository {
  Future<bool> saveCertificadoHive(CertificadoModel simulacroActivo, Box box);
  Future<CertificadoModel?> getSimulacroActivo(Box box);

  Future<bool> saveCertificadoDio(CertificadoModel certificado, String token);
  Future<bool> saveCertificadoTerminado(CertificadoModel certificado, Box box);
}
