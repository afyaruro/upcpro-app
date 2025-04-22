import 'package:get_it/get_it.dart';
import 'package:upcpro_app/Application/Stores/Generic/genericStore.dart';
import 'package:upcpro_app/Application/Stores/Init/initStore.dart';
import 'package:upcpro_app/Application/Stores/User/userStore.dart';

class PersistenceStore {
  final di = GetIt.instance;

  Future<void> initStore() async {

    di.registerLazySingleton(() => StoreInit());
    di.registerLazySingleton(() => StoreUser());
    di.registerLazySingleton(() => StoreGeneric());

  }
}
