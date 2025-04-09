import 'package:get_it/get_it.dart';
import 'package:upcpro_app/Application/Services/UserService.dart';
import 'package:upcpro_app/Domain/Ports/IUserRepository.dart';
import 'package:upcpro_app/Infrastructure/Adapters/UserRepository.dart';
import 'package:upcpro_app/Infrastructure/DataSource/User/AuthDataSource.dart';
import 'package:upcpro_app/Presentation/Stores/User/userStore.dart';

class StartDependency {
  final di = GetIt.instance;

  Future<void> init() async {
    // uses cases
    di.registerLazySingleton(() => Userservice(repository: di()));
    // di.registerLazySingleton(() => AllFavorites(repository: di()));
    // di.registerLazySingleton(() => DeleteFavorites(repository: di()));
    // di.registerLazySingleton(() => NewFavorites(repository: di()));

    di.registerLazySingleton(() => StoreUser());
    // di.registerLazySingleton(() => StoreFavorite());

    // data source
    di.registerLazySingleton<IAuthDataSource>(
        () => AuthDataSource());

    // repositories
    di.registerLazySingleton<IUserRepository>(
        () => UserRepository(authDataSource: di()));


    // final storeUser = GetIt.instance<StoreUser>();
    // final storeFavorite = GetIt.instance<StoreFavorite>();
    // await storeFavorite.getFavorites();
    // await storeCharacter.getCharacters(1);

    
  }
}