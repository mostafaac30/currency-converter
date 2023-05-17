import 'package:currency_converter_app/src/config/constants.dart';
import 'package:currency_converter_app/src/features/exchange_rate/data/models/timeseries_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/dio_factory.dart';

abstract class ExchangeRateDataSource {
  // API CRUD Calls
  Future<List> getExchangeRateData(
    String startDate,
    String endDate,
    String baseCurrency,
    String targetCurrency,
  );
}

class ExchangeRateDataSourceImpl extends ExchangeRateDataSource {
  DioFactory dioFactory;
  ExchangeRateDataSourceImpl({required this.dioFactory});

  @override
  Future<List> getExchangeRateData(
    String startDate,
    String endDate,
    String baseCurrency,
    String targetCurrency,
  ) async {
    //pagination

    final dio = await dioFactory.getDio();
    try {
      final res = await dio.get(
        '${Constants.apiUrl}${Constants.timeSeriesEndpoint}?start_date=$startDate&end_date=$endDate&base=$baseCurrency&symbols=$targetCurrency', //
      );

      if (res.statusCode == 200) {
        TimeSeriesModel timeSeries = TimeSeriesModel.fromJson(res.data);

        List data = timeSeries.rates ?? [];
        // return first 10 records

        return data;
      } else {
        throw Failure(res.statusCode ?? 0, res.statusMessage ?? '');
      }
    } catch (error) {
      debugPrint(error.toString());

      throw ErrorHandler.handle(error);
    }
  }
}
