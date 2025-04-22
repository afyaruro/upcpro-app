// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StoreUser on _StoreUser, Store {
  late final _$tokenAtom = Atom(name: '_StoreUser.token', context: context);

  @override
  String get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  late final _$messageAtom = Atom(name: '_StoreUser.message', context: context);

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$userAtom = Atom(name: '_StoreUser.user', context: context);

  @override
  UserEntity? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserEntity? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_StoreUser.login', context: context);

  @override
  Future<bool> login({required String mail, required String password}) {
    return _$loginAsyncAction
        .run(() => super.login(mail: mail, password: password));
  }

  late final _$createUserAsyncAction =
      AsyncAction('_StoreUser.createUser', context: context);

  @override
  Future<bool> createUser({required UserEntity user}) {
    return _$createUserAsyncAction.run(() => super.createUser(user: user));
  }

  late final _$getUserAsyncAction =
      AsyncAction('_StoreUser.getUser', context: context);

  @override
  Future<dynamic> getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  @override
  String toString() {
    return '''
token: ${token},
message: ${message},
user: ${user}
    ''';
  }
}
