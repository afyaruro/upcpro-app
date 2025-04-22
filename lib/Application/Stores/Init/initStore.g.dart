// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StoreInit on _StoreInit, Store {
  late final _$isLoadingInfoQuestionAtom =
      Atom(name: '_StoreInit.isLoadingInfoQuestion', context: context);

  @override
  bool get isLoadingInfoQuestion {
    _$isLoadingInfoQuestionAtom.reportRead();
    return super.isLoadingInfoQuestion;
  }

  @override
  set isLoadingInfoQuestion(bool value) {
    _$isLoadingInfoQuestionAtom.reportWrite(value, super.isLoadingInfoQuestion,
        () {
      super.isLoadingInfoQuestion = value;
    });
  }

  late final _$isLoadingQuestionAtom =
      Atom(name: '_StoreInit.isLoadingQuestion', context: context);

  @override
  bool get isLoadingQuestion {
    _$isLoadingQuestionAtom.reportRead();
    return super.isLoadingQuestion;
  }

  @override
  set isLoadingQuestion(bool value) {
    _$isLoadingQuestionAtom.reportWrite(value, super.isLoadingQuestion, () {
      super.isLoadingQuestion = value;
    });
  }

  late final _$isLoadingFacultyAtom =
      Atom(name: '_StoreInit.isLoadingFaculty', context: context);

  @override
  bool get isLoadingFaculty {
    _$isLoadingFacultyAtom.reportRead();
    return super.isLoadingFaculty;
  }

  @override
  set isLoadingFaculty(bool value) {
    _$isLoadingFacultyAtom.reportWrite(value, super.isLoadingFaculty, () {
      super.isLoadingFaculty = value;
    });
  }

  late final _$isLoadingCompetenceAtom =
      Atom(name: '_StoreInit.isLoadingCompetence', context: context);

  @override
  bool get isLoadingCompetence {
    _$isLoadingCompetenceAtom.reportRead();
    return super.isLoadingCompetence;
  }

  @override
  set isLoadingCompetence(bool value) {
    _$isLoadingCompetenceAtom.reportWrite(value, super.isLoadingCompetence, () {
      super.isLoadingCompetence = value;
    });
  }

  late final _$isLoadingProgramAtom =
      Atom(name: '_StoreInit.isLoadingProgram', context: context);

  @override
  bool get isLoadingProgram {
    _$isLoadingProgramAtom.reportRead();
    return super.isLoadingProgram;
  }

  @override
  set isLoadingProgram(bool value) {
    _$isLoadingProgramAtom.reportWrite(value, super.isLoadingProgram, () {
      super.isLoadingProgram = value;
    });
  }

  late final _$errorsAtom = Atom(name: '_StoreInit.errors', context: context);

  @override
  List<String> get errors {
    _$errorsAtom.reportRead();
    return super.errors;
  }

  @override
  set errors(List<String> value) {
    _$errorsAtom.reportWrite(value, super.errors, () {
      super.errors = value;
    });
  }

  late final _$ConfigAsyncAction =
      AsyncAction('_StoreInit.Config', context: context);

  @override
  Future<dynamic> Config(
      {required Box<dynamic> boxConfig,
      required Box<dynamic> boxFaculty,
      required Box<dynamic> boxCompetence,
      required Box<dynamic> boxProgram,
      required Box<dynamic> boxQuestion,
      required Box<dynamic> boxInfoquestion}) {
    return _$ConfigAsyncAction.run(() => super.Config(
        boxConfig: boxConfig,
        boxFaculty: boxFaculty,
        boxCompetence: boxCompetence,
        boxProgram: boxProgram,
        boxQuestion: boxQuestion,
        boxInfoquestion: boxInfoquestion));
  }

  late final _$configCompetenceAsyncAction =
      AsyncAction('_StoreInit.configCompetence', context: context);

  @override
  Future<bool> configCompetence(Box<dynamic> box) {
    return _$configCompetenceAsyncAction.run(() => super.configCompetence(box));
  }

  late final _$configFacultyAsyncAction =
      AsyncAction('_StoreInit.configFaculty', context: context);

  @override
  Future<bool> configFaculty(Box<dynamic> box) {
    return _$configFacultyAsyncAction.run(() => super.configFaculty(box));
  }

  late final _$configProgramAsyncAction =
      AsyncAction('_StoreInit.configProgram', context: context);

  @override
  Future<bool> configProgram(Box<dynamic> box) {
    return _$configProgramAsyncAction.run(() => super.configProgram(box));
  }

  late final _$configQuestionAsyncAction =
      AsyncAction('_StoreInit.configQuestion', context: context);

  @override
  Future<bool> configQuestion(Box<dynamic> box) {
    return _$configQuestionAsyncAction.run(() => super.configQuestion(box));
  }

  late final _$configInfoQuestionsAsyncAction =
      AsyncAction('_StoreInit.configInfoQuestions', context: context);

  @override
  Future<bool> configInfoQuestions(Box<dynamic> box) {
    return _$configInfoQuestionsAsyncAction
        .run(() => super.configInfoQuestions(box));
  }

  @override
  String toString() {
    return '''
isLoadingInfoQuestion: ${isLoadingInfoQuestion},
isLoadingQuestion: ${isLoadingQuestion},
isLoadingFaculty: ${isLoadingFaculty},
isLoadingCompetence: ${isLoadingCompetence},
isLoadingProgram: ${isLoadingProgram},
errors: ${errors}
    ''';
  }
}
