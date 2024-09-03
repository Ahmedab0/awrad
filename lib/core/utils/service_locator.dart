
import 'package:awrad/core/utils/api_services.dart';
import 'package:awrad/features/homeFeatures/data/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/favouriteFeature/data/repo/fav_repo_impl.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiServices>()));
  getIt.registerSingleton<FavRepoImpl>(FavRepoImpl(getIt.get<ApiServices>()));
}