import 'package:hive/hive.dart';
import 'package:upcpro_app/Domain/Entities/AuthResult.dart';
import 'package:upcpro_app/Domain/Ports/IUserRepository.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';

class Userservice {
  final IUserRepository repository;

  Userservice({required this.repository});

  Future<ResponseEntity<AuthResult>> auth({required String mail, required String password}) async {
    var resp = await repository.auth(mail: mail, password: password);

    if (resp.isError) {
      return resp;
    } else {
      final boxUser = await Hive.openBox('user');
      final boxToken = await Hive.openBox('token');

      await boxUser.put(resp.entity!.user.id, resp.entity!.user.toJson());
      await boxToken.put('token', resp.entity!.token);

      return resp;
    }
  }
}
