import 'dart:developer';

import 'package:awrad/core/error/failure.dart';
import 'package:awrad/features/favouriteFeature/data/repo/fav_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
//import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/api_services.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/shared_pref_helper.dart';
import '../../../homeFeatures/data/models/category_azkar_model.dart';

class FavRepoImpl implements FavRepo {
  final ApiServices apiServices;

  FavRepoImpl(this.apiServices);

  final Constant _const = Constant();


// get favAzkars
  @override
  Future<Either<Failure, List<CategoryAzkarModel>>> fetchFavAzkars() async {
    var uniqueId = await getOrCreateUuid();
    try {
      Map<String, dynamic> extractData =
          await apiServices.get(endPoint: _const.favAzkars, queryParams: {
            'page': 1,
            'uuid': uniqueId,
          });
      List<CategoryAzkarModel> favAzkarList = [];
      for (var favItem in extractData["data"]) {
        favAzkarList.add(CategoryAzkarModel.fromJson(favItem));
      }
      log('extractData from FavRepoImpl = $extractData');
      log('favAzkarList from FavRepoImpl  = $favAzkarList');
      //final prefs = await SharedPreferences.getInstance();
      return right(favAzkarList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMsg: e.toString()));
    }
  }
}
