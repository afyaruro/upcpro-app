import 'package:hive/hive.dart';
import 'package:upcpro_app/Infrastructure/Models/Certificado/CertificadoModel.dart';

class GetSimulacroActiveDataSourceHive {
  GetSimulacroActiveDataSourceHive();

  Future<CertificadoModel?> getSimulacroActivo(Box box) async {
    try {
      final data = box.get("simulacro-activo");
      final simulacrosModel = CertificadoModel.fromJsonHive(data);

      return simulacrosModel;
    } catch (e) {
      return null;
    }
  }
}
