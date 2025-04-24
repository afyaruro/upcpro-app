// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificadoStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StoreCertificado on _StoreCertificado, Store {
  late final _$certificadosAtom =
      Atom(name: '_StoreCertificado.certificados', context: context);

  @override
  List<CertificadoEntity> get certificados {
    _$certificadosAtom.reportRead();
    return super.certificados;
  }

  @override
  set certificados(List<CertificadoEntity> value) {
    _$certificadosAtom.reportWrite(value, super.certificados, () {
      super.certificados = value;
    });
  }

  late final _$simulacroActivoAtom =
      Atom(name: '_StoreCertificado.simulacroActivo', context: context);

  @override
  CertificadoEntity? get simulacroActivo {
    _$simulacroActivoAtom.reportRead();
    return super.simulacroActivo;
  }

  @override
  set simulacroActivo(CertificadoEntity? value) {
    _$simulacroActivoAtom.reportWrite(value, super.simulacroActivo, () {
      super.simulacroActivo = value;
    });
  }

  late final _$isRefreshingCertificadosAtom = Atom(
      name: '_StoreCertificado.isRefreshingCertificados', context: context);

  @override
  bool get isRefreshingCertificados {
    _$isRefreshingCertificadosAtom.reportRead();
    return super.isRefreshingCertificados;
  }

  @override
  set isRefreshingCertificados(bool value) {
    _$isRefreshingCertificadosAtom
        .reportWrite(value, super.isRefreshingCertificados, () {
      super.isRefreshingCertificados = value;
    });
  }

  late final _$generatedAtom =
      Atom(name: '_StoreCertificado.generated', context: context);

  @override
  bool get generated {
    _$generatedAtom.reportRead();
    return super.generated;
  }

  @override
  set generated(bool value) {
    _$generatedAtom.reportWrite(value, super.generated, () {
      super.generated = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_StoreCertificado.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$totalSecondsAtom =
      Atom(name: '_StoreCertificado.totalSeconds', context: context);

  @override
  int get totalSeconds {
    _$totalSecondsAtom.reportRead();
    return super.totalSeconds;
  }

  @override
  set totalSeconds(int value) {
    _$totalSecondsAtom.reportWrite(value, super.totalSeconds, () {
      super.totalSeconds = value;
    });
  }

  late final _$formattedTimeAtom =
      Atom(name: '_StoreCertificado.formattedTime', context: context);

  @override
  String get formattedTime {
    _$formattedTimeAtom.reportRead();
    return super.formattedTime;
  }

  @override
  set formattedTime(String value) {
    _$formattedTimeAtom.reportWrite(value, super.formattedTime, () {
      super.formattedTime = value;
    });
  }

  late final _$isTimerRunningAtom =
      Atom(name: '_StoreCertificado.isTimerRunning', context: context);

  @override
  bool get isTimerRunning {
    _$isTimerRunningAtom.reportRead();
    return super.isTimerRunning;
  }

  @override
  set isTimerRunning(bool value) {
    _$isTimerRunningAtom.reportWrite(value, super.isTimerRunning, () {
      super.isTimerRunning = value;
    });
  }

  late final _$optionSelectedAtom =
      Atom(name: '_StoreCertificado.optionSelected', context: context);

  @override
  int get optionSelected {
    _$optionSelectedAtom.reportRead();
    return super.optionSelected;
  }

  @override
  set optionSelected(int value) {
    _$optionSelectedAtom.reportWrite(value, super.optionSelected, () {
      super.optionSelected = value;
    });
  }

  late final _$getSimulacroActiveAsyncAction =
      AsyncAction('_StoreCertificado.getSimulacroActive', context: context);

  @override
  Future<dynamic> getSimulacroActive(Box<dynamic> box) {
    return _$getSimulacroActiveAsyncAction
        .run(() => super.getSimulacroActive(box));
  }

  late final _$_StoreCertificadoActionController =
      ActionController(name: '_StoreCertificado', context: context);

  @override
  void initializeTimer(int initialMinutes) {
    final _$actionInfo = _$_StoreCertificadoActionController.startAction(
        name: '_StoreCertificado.initializeTimer');
    try {
      return super.initializeTimer(initialMinutes);
    } finally {
      _$_StoreCertificadoActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrementTimer() {
    final _$actionInfo = _$_StoreCertificadoActionController.startAction(
        name: '_StoreCertificado.decrementTimer');
    try {
      return super.decrementTimer();
    } finally {
      _$_StoreCertificadoActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateFormattedTime() {
    final _$actionInfo = _$_StoreCertificadoActionController.startAction(
        name: '_StoreCertificado.updateFormattedTime');
    try {
      return super.updateFormattedTime();
    } finally {
      _$_StoreCertificadoActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startTimer() {
    final _$actionInfo = _$_StoreCertificadoActionController.startAction(
        name: '_StoreCertificado.startTimer');
    try {
      return super.startTimer();
    } finally {
      _$_StoreCertificadoActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopTimer() {
    final _$actionInfo = _$_StoreCertificadoActionController.startAction(
        name: '_StoreCertificado.stopTimer');
    try {
      return super.stopTimer();
    } finally {
      _$_StoreCertificadoActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
certificados: ${certificados},
simulacroActivo: ${simulacroActivo},
isRefreshingCertificados: ${isRefreshingCertificados},
generated: ${generated},
isLoading: ${isLoading},
totalSeconds: ${totalSeconds},
formattedTime: ${formattedTime},
isTimerRunning: ${isTimerRunning},
optionSelected: ${optionSelected}
    ''';
  }
}
