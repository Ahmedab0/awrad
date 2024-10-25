import 'package:awrad/core/error/failure.dart';
import 'package:awrad/features/moreFeature/data/repos/app_info_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/api_services.dart';
import '../../../../core/utils/constant.dart';
import '../models/app_info_model/app_info_model.dart';

class AppInfoRepoImpl implements AppInfoRepo {
  final ApiServices apiServices;

  AppInfoRepoImpl(this.apiServices);

  final Constant _const = Constant();


  @override
  Future<Either<Failure, Map<String, dynamic>>> fetchAppInfo() async {
    try {
      var extractData = await apiServices.get(endPoint: _const.aboutApp);
      AppInfoModel.fromJson(extractData);
      return right(extractData);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMsg: e.toString()));
    }
  }
}
