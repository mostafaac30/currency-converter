import 'package:dartz/dartz.dart';
import 'package:email_app/src/core/network/network_info.dart';

import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failure.dart';
import '../datasources/home_datasource.dart';
import 'home_repo.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDataSource _dataSource;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl({
    required HomeDataSource remoteDataSource,
    required this.networkInfo,
  }) : _dataSource = remoteDataSource;

  @override
  Future<Either<Failure, List>> getData(
      int page, String startDate, String endDate) async {
    if (await networkInfo.isConnected) {
      try {
        //fetch quote from api
        final data = await _dataSource.getData(page, startDate, endDate);

        return Right(data);
      } catch (e) {
        print('error in repo with res ${e.toString()}');

        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      //from cache
      return Left(DataSource.CACHE_ERROR.getFailure());

      // try {
      //   return const Right([]);
      // } catch (error) {
      //   print('error in repo');

      //   return Left(DataSource.CACHE_ERROR.getFailure());
      // }
    }
  }
}
