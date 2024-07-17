import 'package:e_medicine/data/datasource/auth_datasource.dart';
import 'package:e_medicine/data/repository_impl/auth_repository_impl.dart';
import 'package:e_medicine/domain/repository/auth_repository.dart';
import 'package:e_medicine/domain/use_case/auth_use_case/login_with_email_password_use_case.dart';
import 'package:get_it/get_it.dart';

class ConfigDi {
  static final ConfigDi _singleton = ConfigDi._internal();

  factory ConfigDi() {
    return _singleton;
  }

  ConfigDi._internal() {
    // use_case
    injector.registerLazySingleton<LoginWithEmailPasswordUseCase>(() => LoginWithEmailPasswordUseCase(injector.get()));

    // repository
    injector.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(injector.get()));

    // datasource
    injector.registerLazySingleton<AuthDataSource>(() => AuthDataSource());

    //bloc
  }

  GetIt injector = GetIt.instance;
}