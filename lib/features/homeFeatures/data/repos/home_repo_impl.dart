import 'dart:developer';

import 'package:awrad/core/error/failure.dart';
import 'package:awrad/core/utils/constant.dart';
import 'package:awrad/features/homeFeatures/data/models/Slider_model.dart';
import 'package:awrad/features/homeFeatures/data/models/category_azkar_model.dart';
import 'package:awrad/features/homeFeatures/data/models/category_model.dart';
import 'package:awrad/features/homeFeatures/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/utils/api_services.dart';
import '../models/toggle_fav_response.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl(this.apiServices);

  final Constant _const = Constant();
  var uuid = const Uuid().v1();




  // get Categories implementation
  @override
  Future<Either<Failure, List<CategoryModel>>> fetchHomeCategories() async {
    try {
      var response = await apiServices.get(endPoint: _const.homePage);
      List<CategoryModel> categories = [];
      var extractData = response["data"]["categories"];
      for (var category in extractData) {
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
  // get Slider implementation
  @override
  Future<Either<Failure, List<SliderModel>>> fetchSliders() async {
    try {
      Map<String, dynamic> extractData =
          await apiServices.get(endPoint: _const.homePage) as Map<String, dynamic>;
      List<SliderModel> sliders = [];
      for (var slider in extractData["data"]["sliders"]) {
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

  // get Categories Azkar Items implementation
  @override
  Future<Either<Failure, List<CategoryAzkarModel>>> fetchCategoriesAzkar(categoryId) async {
    try {
      var response =
          await apiServices.post(endPoint: _const.categoryAzkar, body: {"category_id": categoryId, "uuid": _const.uuid});
      List<CategoryAzkarModel> items = [];
      var extractData = response["data"];
      for (var item in extractData) {
        items.add(CategoryAzkarModel.fromJson(item));
        log('extractData = $extractData');
        log('items List  = $items');
      }
      return right(items);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure(errorMsg: e.toString()));
      }
      return left(ServerFailure(errorMsg: e.toString()));
    }
  }

  // Toggle Favorite implementation
  @override
  Future<Either<Failure, Map<String, dynamic>>> toggleFavorite(int azkarId) async{
    try {
      Map<String, dynamic> extractData =  await apiServices.post(endPoint: _const.toggleFav, body: {"azkar_id": azkarId, "uuid": _const.uuid});
      log('response: $extractData');
      ToggleFavResponse.fromJson(extractData);
      return right(extractData);
    } catch (e) {
      if(e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMsg: e.toString()));
    }
  }

}
