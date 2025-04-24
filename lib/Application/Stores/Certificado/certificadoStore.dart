import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
import 'package:upcpro_app/Application/Services/Certificado/CertificadoService.dart';
import 'package:upcpro_app/Domain/Entities/RespuestaSimulacro/CertificadoEntity.dart';

part 'certificadoStore.g.dart';

class StoreCertificado = _StoreCertificado with _$StoreCertificado;

abstract class _StoreCertificado with Store {
  @observable
  List<CertificadoEntity> certificados = [];

  @observable
  CertificadoEntity? simulacroActivo;

  @observable
  bool isRefreshingCertificados = false;

  @observable
  bool generated = false;

  @observable
  bool isLoading = false;

  // Variables para el temporizador
  @observable
  int totalSeconds = 0;

  @observable
  String formattedTime = "00:00:00";

  @observable
  bool isTimerRunning = false;

  @observable
  int optionSelected = 0;

  @action
  Future getSimulacroActive(Box box) async {
    final service = GetIt.instance<CertificadoService>();
    var resp = await service.getSimulacroActivo(box);
    simulacroActivo = resp;
  }

  @action
  void initializeTimer(int initialMinutes) {
    totalSeconds = initialMinutes * 60;
    updateFormattedTime();
    isTimerRunning = false;
  }

  @action
  void decrementTimer() {
    if (totalSeconds > 0) {
      totalSeconds -= 1;
      updateFormattedTime();
    } else {
      isTimerRunning = false;
    }
  }

  @action
  void updateFormattedTime() {
    int hours = totalSeconds ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    int seconds = totalSeconds % 60;

    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');

    formattedTime = '$hoursStr:$minutesStr:$secondsStr';
  }

  @action
  void startTimer() {
    isTimerRunning = true;
  }

  @action
  void stopTimer() {
    isTimerRunning = false;
  }
}
