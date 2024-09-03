
import 'dart:developer';

import 'package:awrad/core/error/failure.dart';
import 'package:awrad/features/moreFeature/data/repos/settings_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/api_services.dart';
import '../models/about_app_model.dart';

class SettingsRepoImpl implements SettingsRepo {
  
  final ApiServices apiServices ;

  SettingsRepoImpl(this.apiServices);

  // Fetch App Info Implementation
  @override
  Future<Either<Failure, AboutAppModel>> fetchAppInfo() async {
    try {
       var extractData = await apiServices.get(endPoint: 'aboutApp') as AboutAppModel;
       AboutAppModel.fromJson(extractData);
      log('extractData = $extractData');
      return right(extractData);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMsg: e.toString()));
    }
  }

}