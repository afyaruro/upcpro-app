import 'package:hive/hive.dart';
import 'package:upcpro_app/Infrastructure/Models/Certificado/CertificadoModel.dart';

abstract class ICertificadoRepository {
  Future<bool> saveCertificadoHive(CertificadoModel simulacroActivo, Box box);
  Future<CertificadoModel?> getSimulacroActivo(Box box);
}
