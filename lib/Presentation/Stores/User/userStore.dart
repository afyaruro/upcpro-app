import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:upcpro_app/Application/Services/UserService.dart';
import 'package:upcpro_app/Domain/Entities/UserEntity.dart';

part 'userStore.g.dart';

class StoreUser = _StoreUser with _$StoreUser;

abstract class _StoreUser with Store {
  @observable
  String token = '';

  @observable
  String message = '';

  @observable
  UserEntity? user;

  @observable
  bool isLoading = false;

  @action
  Future<bool> login({required String mail, required String password}) async {
    try {
      isLoading = true;
      print("Hola:");

      final userService = GetIt.instance<Userservice>();

      var response = await userService.auth(mail: mail, password: password);

      if (response.isError) {
        message = response.message;
        isLoading = false;

        return false;
      } else {
        token = response.entity!.token;
        user = response.entity!.user;
        message = response.message;
        isLoading = false;

        return true;
      }
    } catch (e) {
      isLoading = false;
      return false;
    }
  }
}
