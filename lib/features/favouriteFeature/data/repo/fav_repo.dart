import 'package:awrad/features/homeFeatures/data/models/category_azkar_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class FavRepo {
  Future<Either<Failure, List<CategoryAzkarModel>>> fetchFavAzkars();
}
