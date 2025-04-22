import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:upcpro_app/Application/Services/User/UserService.dart';
import 'package:upcpro_app/Domain/Entities/User/UserEntity.dart';

part 'userStore.g.dart';

class StoreUser = _StoreUser with _$StoreUser;

abstract class _StoreUser with Store {
  @observable
  String token = '';

  @observable
  String message = '';

  @observable
  UserEntity? user;

  @action
  Future<bool> login({required String mail, required String password}) async {
    try {
      final userService = GetIt.instance<UserService>();

      var response = await userService.auth(mail: mail, password: password);

      if (response.isError!) {
        message = response.message;

        return false;
      } else {
        var (user, token) = response.entity!;
        token = token;
        user = user;
        message = response.message;

        return true;
      }
    } catch (e) {
      return false;
    }
  }

  @action
  Future<bool> createUser({required UserEntity user}) async {
    try {
      final userService = GetIt.instance<UserService>();
      var response = await userService.createUserDio(user: user);

      if (response.isError!) {
        message = response.message;
        return false;
      } else {
        var (user, token) = response.entity!;
        this.token = token;
        this.user = user.toEntity();
        this.message = response.message;
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  @action
  Future getUser() async {
    final userService = GetIt.instance<UserService>();

    var response = await userService.obtenerUserLocal();

    if (!response.isError!) {
      var (user, token) = response.entity!;

      var resp = await userService.refreshToken(userId: user.id);
      var (newUser, newToken) = resp.entity!;

      if (resp.isError!) {
        token = '';
      } else {
        this.user = newUser.toEntity();
        this.token = newToken;
      }
    }
  }
}
