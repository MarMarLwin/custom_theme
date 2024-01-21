
import 'package:custom_theme/application/advice/cubit/advicer_cubit.dart';
import 'package:custom_theme/domain/usecases/advicer_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'application/theme/theme_service.dart';
import 'domain/repositories/advice/advice_repository.dart';
import 'domain/repositories/theme/theme_repository.dart';
import 'domain/usecases/theme_usecase.dart';
import 'data/datasources/advice_remote_datasource.dart';
import 'data/datasources/theme_local_datasource.dart';
import 'data/repositories/advice_repository_impl.dart';
import 'data/repositories/theme_repository_impl.dart';


final sl = GetIt.I; // sl == service locator

Future<void> init({required Client client}) async {
  //? ##################### advicer #####################

  //! state management
  sl
    ..registerFactory(() => AdviceCubit(adviceUsecases: sl()))
    //! Use cases
    ..registerLazySingleton(() => AdvicerUsecases(advicerRepository: sl()))
    //! Repositories
    ..registerLazySingleton<AdviceRepository>(
        () => AdviceRepositoryImpl(adviceRemoteDatasource: sl()))
    //! data sources
    ..registerLazySingleton<AdviceRemoteDatasource>(
        () => AdviceRemoteDatasourceImplementation(client: sl()))
    //! External
    ..registerLazySingleton(() => client)

    //? ##################### theme #####################

    //! state management
    ..registerLazySingleton<ThemeService>(
        () => ThemeServiceImpl(themeUsecases: sl()))
    //! usecases

    ..registerLazySingleton(() => ThemeUsecases(themeRepository: sl()))
    //! repositories
    ..registerLazySingleton<ThemeRepository>(
        () => ThemeRepositoryImpl(themeLocalDatasource: sl()))
    //! datasources
    ..registerLazySingleton<ThemeLocalDatasource>(
        () => ThemeLocalDatasourceImpl(sharedPreferences: sl()));
  //! external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}