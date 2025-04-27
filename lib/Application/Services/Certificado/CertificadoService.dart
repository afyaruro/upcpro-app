import 'package:hive/hive.dart';
import 'package:upcpro_app/Domain/Entities/RespuestaSimulacro/CertificadoEntity.dart';
import 'package:upcpro_app/Domain/Ports/Certificado/ICertificadoRepository.dart';

class CertificadoService {
  final ICertificadoRepository repository;

  CertificadoService({required this.repository});

  Future<bool> saveCertificadosHive(
    CertificadoEntity simulacroActivo,
    Box box,
  ) async {
    return await repository.saveCertificadoHive(simulacroActivo.toModel(), box);
  }

  Future<CertificadoEntity?> getSimulacroActivo(Box box) async {
    final simulacroActivo = await repository.getSimulacroActivo(box);

    if (simulacroActivo != null) {
      return simulacroActivo.toEntity();
    }

    return null;
  }

  Future<bool> saveDioCertificado(
    CertificadoEntity certificado,
    String token,
  ) async {
    return await repository.saveCertificadoDio(certificado.toModel(), token);
  }

  // falta el eliminar pero solo el activo es decir o cuando ya la fecha pase o cuando
  //se termine pero antes de eliminar debe guardar los resultados
}
