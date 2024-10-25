import 'package:awrad/features/homeFeatures/data/models/Slider_model.dart';
import 'package:awrad/features/homeFeatures/data/models/category_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../models/category_azkar_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CategoryModel>>> fetchHomeCategories();
  Future<Either<Failure, List<SliderModel>>> fetchSliders();
  Future<Either<Failure, List<CategoryAzkarModel>>> fetchCategoriesAzkar(int categoryId);
  Future<Either<Failure, Map<String, dynamic>>> toggleFavorite(int azkarId);

}
