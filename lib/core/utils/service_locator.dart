import 'package:awrad/core/utils/api_services.dart';
import 'package:awrad/features/homeFeatures/data/repos/home_repo_impl.dart';
import 'package:awrad/features/moreFeature/data/repos/app_info_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/favouriteFeature/data/repo/fav_repo_impl.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiServices>(
      ApiServices(ApiServices(Dio()).createSetupDio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiServices>()));
  getIt.registerSingleton<AppInfoRepoImpl>(
      AppInfoRepoImpl(getIt.get<ApiServices>()));
  getIt.registerSingleton<FavRepoImpl>(FavRepoImpl(getIt.get<ApiServices>()));
}
