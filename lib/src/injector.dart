import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:currency_converter_app/src/core/network/dio_factory.dart';
import 'package:currency_converter_app/src/core/network/network_info.dart';
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
  sl.registerLazySingleton<DioFactory>(() => DioFactory());

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
}
