import 'package:hive/hive.dart';
import 'package:upcpro_app/Infrastructure/Models/User/UserModel.dart';

class SaveUserDataSourceHive {
  SaveUserDataSourceHive();

  Future<bool> saveUser(UserModel user, String token) async {
    try {
      final boxUser = await Hive.openBox('user');
      final boxToken = await Hive.openBox('token');

      await boxUser.put("user", user.toJson());
      await boxToken.put("token", token);

      return true;
    } catch (e) {
      return false;
    }
  }
}
