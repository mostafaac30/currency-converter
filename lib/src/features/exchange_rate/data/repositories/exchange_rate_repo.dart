import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class ExchangeRateRepository {
  Future<Either<Failure, List>> getExchangeRateData(
    String startDate,
    String endDate,
    String baseCurrency,
    String targetCurrency,
  );
}
