import 'dart:developer';

import 'package:awrad/core/error/failure.dart';
import 'package:awrad/features/favouriteFeature/data/repo/fav_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/utils/api_services.dart';
import '../../../../core/utils/constant.dart';
import '../../../homeFeatures/data/models/category_azkar_model.dart';

class FavRepoImpl implements FavRepo {
  final ApiServices apiServices;

  FavRepoImpl(this.apiServices);

  final Constant _const = Constant();
  var uuid = const Uuid().v1();


// get favAzkars
  @override
  Future<Either<Failure, List<CategoryAzkarModel>>> fetchFavAzkars() async {
    try {
      Map<String, dynamic> extractData =
          await apiServices.get(endPoint: "${_const.favAzkars}?page=1&uuid=$uuid");
      List<CategoryAzkarModel> favAzkarList = [];
      for (var favItem in extractData["data"]) {
        favAzkarList.add(CategoryAzkarModel.fromJson(favItem));
      }
      log('extractData from FavRepoImpl = $extractData');
      log('favAzkarList from FavRepoImpl  = $favAzkarList');
      return right(favAzkarList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMsg: e.toString()));
    }
  }
}
