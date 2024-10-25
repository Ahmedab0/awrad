import 'package:awrad/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AppInfoRepo {
  Future<Either<Failure, Map<String, dynamic>>> fetchAppInfo();
}
