import 'package:upcpro_app/Domain/Entities/UserEntity.dart';

class AuthResult {
  final UserEntity user;
  final String token;

  AuthResult({
    required this.user,
    required this.token,
  });
}
