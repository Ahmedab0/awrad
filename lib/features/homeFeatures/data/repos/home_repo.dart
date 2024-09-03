import 'package:awrad/features/homeFeatures/data/models/Slider_model.dart';
import 'package:awrad/features/homeFeatures/data/models/category_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class HomeRepo {

  Future<Either<Failure, List<CategoryModel>>> fetchHomeCategories();
  Future<Either<Failure, List<SliderModel>>> fetchSliders();

}