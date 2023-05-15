import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:email_app/src/config/app_prefs.dart';
import 'package:email_app/src/core/network/dio_factory.dart';
import 'package:email_app/src/core/network/network_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/home/data/datasources/home_datasource.dart';
import 'features/home/data/repositories/home_repo.dart';
import 'features/home/data/repositories/home_repo_impl.dart';
import 'features/home/presentation/cubit/home_view_cubit.dart';
import 'features/splash/presentation/cubit/splash_cubit.dart';

final sl = GetIt.instance;
Future<void> init() async {
  ///features[]
//blocs

  //registerFactory ? create a new instance once it called.

  // if a cubit closed on a screen, Not affect other screens

  // sl.registerFactory<RandomQuoteCubit>(
  //     () => RandomQuoteCubit(getRandomQuoteUseCase: sl()));

  sl.registerFactory<SplashCubit>(() => SplashCubit());
  sl.registerFactory<HomeViewCubit>(() => HomeViewCubit(
        repository: sl(),
      ));

  // repositories

  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(
        remoteDataSource: sl(),
        networkInfo: sl(),
      ));

// data sources

  //start from here
  sl.registerLazySingleton<HomeDataSource>(
      () => HomeDataSourceImpl(dioFactory: sl()));

  ///core
  sl.registerLazySingleton<DioFactory>(() => DioFactory(appPreferences: sl()));

  sl.registerLazySingleton<NetworkInfo>(
      () => InternetInfoImp(internetConnectionChecker: sl()));

  ///external
  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => sharedPreferences);
  final InternetConnectionChecker internetInstance =
      InternetConnectionChecker.createInstance(
    checkInterval: const Duration(seconds: 2),
    checkTimeout: const Duration(seconds: 5),
  );
  sl.registerLazySingleton(() => internetInstance);
  sl.registerLazySingleton(() => AppPreferences(sharedPreferences));
}
