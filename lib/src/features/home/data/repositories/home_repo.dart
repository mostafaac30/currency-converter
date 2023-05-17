import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class HomeRepository {
  Future<Either<Failure, List>> getData(
    String startDate,
    String endDate,
    String baseCurrency,
    String targetCurrency,
  );
}
