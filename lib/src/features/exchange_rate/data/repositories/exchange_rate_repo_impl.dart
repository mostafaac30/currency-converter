import 'package:dartz/dartz.dart';
import 'package:currency_converter_app/src/core/network/network_info.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failure.dart';
import '../datasources/exchange_rate_datasource.dart';
import 'exchange_rate_repo.dart';

class ExchangeRateRepositoryImpl extends ExchangeRateRepository {
  final ExchangeRateDataSource _dataSource;
  final NetworkInfo networkInfo;

  ExchangeRateRepositoryImpl({
    required ExchangeRateDataSource remoteDataSource,
    required this.networkInfo,
  }) : _dataSource = remoteDataSource;

  @override
  Future<Either<Failure, List>> getExchangeRateData(
    String startDate,
    String endDate,
    String baseCurrency,
    String targetCurrency,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        //fetch  from api
        final data = await _dataSource.getExchangeRateData(
            startDate, endDate, baseCurrency, targetCurrency);

        return Right(data);
      } catch (e) {
        debugPrint('error in repo with res ${e.toString()}');

        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      //from cache
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());

      // try {
      //   return const Right([]);
      // } catch (error) {
      //   print('error in repo');

      //   return Left(DataSource.CACHE_ERROR.getFailure());
      // }
    }
  }
}
