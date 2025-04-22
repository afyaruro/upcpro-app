
import 'package:hive/hive.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/Models/User/UserModel.dart';


class GetUserDataSourceHive{

  GetUserDataSourceHive();

  Future<ResponseEntity<(UserModel, String)>> getUserHive() async {
    try {
      final boxUser = await Hive.openBox('user');
      final boxToken = await Hive.openBox('token');
      
      final tokenData = boxToken.get('token');
       final userData = boxUser.get('user');

      if (userData != null) {
        final user = UserModel.fromJsonHive(userData);
        if (tokenData != null) {
          final token = tokenData;

          return ResponseEntity.singleEntity(
            message: "usuario obtenido",
            entity: (user, token),
          );
        }
      }
      return ResponseEntity.error(message: "Usuario no encontrado");
    } catch (e) {
      return ResponseEntity.error(message: 'Failed to retrieve user data: $e');
    }
  }
}
