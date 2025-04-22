// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genericStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StoreGeneric on _StoreGeneric, Store {
  late final _$facultiesAtom =
      Atom(name: '_StoreGeneric.faculties', context: context);

  @override
  List<FacultyEntity> get faculties {
    _$facultiesAtom.reportRead();
    return super.faculties;
  }

  @override
  set faculties(List<FacultyEntity> value) {
    _$facultiesAtom.reportWrite(value, super.faculties, () {
      super.faculties = value;
    });
  }

  late final _$competencesAtom =
      Atom(name: '_StoreGeneric.competences', context: context);

  @override
  List<CompetenceEntity> get competences {
    _$competencesAtom.reportRead();
    return super.competences;
  }

  @override
  set competences(List<CompetenceEntity> value) {
    _$competencesAtom.reportWrite(value, super.competences, () {
      super.competences = value;
    });
  }

  late final _$programsAtom =
      Atom(name: '_StoreGeneric.programs', context: context);

  @override
  List<ProgramEntity> get programs {
    _$programsAtom.reportRead();
    return super.programs;
  }

  @override
  set programs(List<ProgramEntity> value) {
    _$programsAtom.reportWrite(value, super.programs, () {
      super.programs = value;
    });
  }

  late final _$simulacrosAtom =
      Atom(name: '_StoreGeneric.simulacros', context: context);

  @override
  List<SimulacroEntity> get simulacros {
    _$simulacrosAtom.reportRead();
    return super.simulacros;
  }

  @override
  set simulacros(List<SimulacroEntity> value) {
    _$simulacrosAtom.reportWrite(value, super.simulacros, () {
      super.simulacros = value;
    });
  }

  late final _$getFacultiesAsyncAction =
      AsyncAction('_StoreGeneric.getFaculties', context: context);

  @override
  Future<dynamic> getFaculties(Box<dynamic> box) {
    return _$getFacultiesAsyncAction.run(() => super.getFaculties(box));
  }

  late final _$getProgramsAsyncAction =
      AsyncAction('_StoreGeneric.getPrograms', context: context);

  @override
  Future<dynamic> getPrograms(Box<dynamic> box) {
    return _$getProgramsAsyncAction.run(() => super.getPrograms(box));
  }

  late final _$getCompetenceAsyncAction =
      AsyncAction('_StoreGeneric.getCompetence', context: context);

  @override
  Future<dynamic> getCompetence(Box<dynamic> box) {
    return _$getCompetenceAsyncAction.run(() => super.getCompetence(box));
  }

  late final _$getSimulacrosAsyncAction =
      AsyncAction('_StoreGeneric.getSimulacros', context: context);

  @override
  Future<dynamic> getSimulacros(Box<dynamic> box) {
    return _$getSimulacrosAsyncAction.run(() => super.getSimulacros(box));
  }

  @override
  String toString() {
    return '''
faculties: ${faculties},
competences: ${competences},
programs: ${programs},
simulacros: ${simulacros}
    ''';
  }
}
