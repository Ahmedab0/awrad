import 'dart:developer';

import 'package:awrad/core/error/failure.dart';
import 'package:awrad/features/favouriteFeature/data/repo/fav_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/api_services.dart';
import '../models/Fav_category_model.dart';

class FavRepoImpl implements FavRepo {
  final ApiServices apiServices;

  FavRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, List<FavCategoryModel>>> fetchFavCategories() async {
    try {
      Map<String, dynamic> extractData =
          await apiServices.get(endPoint: 'favCategory');
      List<FavCategoryModel> favList = [];
      for (var fav in extractData["data"]) {
        favList.add(FavCategoryModel.fromJson(fav));
      }
      log('extractData = $extractData');
      log('categories List  = $favList');
      return right(favList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMsg: e.toString()));
    }
  }
}
