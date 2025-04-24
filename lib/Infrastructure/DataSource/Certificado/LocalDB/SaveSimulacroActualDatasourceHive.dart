import 'package:hive/hive.dart';
import 'package:upcpro_app/Infrastructure/Models/Certificado/CertificadoModel.dart';

class SaveSimulacroActualDataSourceHive {
  SaveSimulacroActualDataSourceHive();

  Future<bool> saveSimulacroActual(
    CertificadoModel simulacroActivo,
    Box box,
  ) async {
    try {
      await box.put(
        "simulacro-activo",
        simulacroActivo.toJsonSimulacroActivoHive(),
      );

      return true;
    } catch (e) {
      return false;
    }
  }
}
