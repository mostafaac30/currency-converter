import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class HomeRepository {
  Future<Either<Failure, List>> getData(
      int page, String startDate, String endDate);
}
