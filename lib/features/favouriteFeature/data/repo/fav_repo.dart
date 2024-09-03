
import 'package:awrad/features/favouriteFeature/data/models/Fav_category_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class FavRepo {
  Future<Either<Failure,List<FavCategoryModel>>> fetchFavCategories();
}