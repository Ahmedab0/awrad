
import 'dart:developer';

import 'package:awrad/core/error/failure.dart';
import 'package:awrad/features/homeFeatures/data/models/Slider_model.dart';
import 'package:awrad/features/homeFeatures/data/models/category_model.dart';
import 'package:awrad/features/homeFeatures/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/api_services.dart';

class HomeRepoImpl implements HomeRepo {
  
  final ApiServices apiServices ;

  HomeRepoImpl(this.apiServices);

  // Fetch Categories implementation
  @override
  Future<Either<Failure, List<CategoryModel>>> fetchHomeCategories() async {
    try {
      var extractData = await apiServices.get(endPoint: 'homePage');
      log('fetchHomeCategoriesssssssssssss');

      List<CategoryModel> categories = [];
      for(var category in extractData["data"]["categories"]) {
        categories.add(CategoryModel.fromJson(category));
        log('extractData = $extractData');
        log('categories List  = $categories');
      }
      return right(categories);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMsg: e.toString()));
    }

  }

  // Fetch Slider implementation
  @override
  Future<Either<Failure, List<SliderModel>>> fetchSliders() async {
    try {
      Map<String, dynamic> extractData = await apiServices.get(endPoint: 'homePage') as Map<String, dynamic>;
      List<SliderModel> sliders = [];
      for(var slider in extractData["data"]["sliders"]) {
        sliders.add(SliderModel.fromJson(slider));
      }
      log('extractData = $extractData');
      log('categories List  = $sliders');
      return right(sliders);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMsg: e.toString()));
    }
  }

}