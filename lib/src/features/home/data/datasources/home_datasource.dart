import 'package:email_app/src/config/constants.dart';
import 'package:email_app/src/features/home/data/models/timeseries_model.dart';

import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/dio_factory.dart';

abstract class HomeDataSource {
  // API CRUD Calls
  Future<List> getData(int page, String startDate, String endDate);
}

class HomeDataSourceImpl extends HomeDataSource {
  DioFactory dioFactory;
  HomeDataSourceImpl({required this.dioFactory});

  @override
  Future<List> getData(int page, String startDate, String endDate) async {
//pagination
    int start = (page - 1) * Constants.requestLimit + 1;

    int end = page * Constants.requestLimit;

    final dio = await dioFactory.getDio();
    try {
      final res = await dio.get(
        '${Constants.apiUrl}${Constants.timeseriesEndpoint}?start_date=$startDate&end_date=$endDate&page=$page&limit=${Constants.requestLimit}', //
      );

      if (res.statusCode == 200) {
        TimeSeriesModel timeSeries = TimeSeriesModel.fromJson(res.data);
        print('success in remote DS with res');

        List data = timeSeries.rates ?? [];
        // return first 10 records
        return data.sublist(start, end);
      } else {
        print('error in remote DS with res');

        throw Failure(res.statusCode ?? 0, res.statusMessage ?? '');
      }
    } catch (error) {
      print('error in remote DS');
      print(error);

      throw ErrorHandler.handle(error);
    }
  }
}
