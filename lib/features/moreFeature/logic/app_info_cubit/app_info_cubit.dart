import 'dart:developer';

import 'package:awrad/features/moreFeature/data/repos/app_info_repo.dart';
//import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:meta/meta.dart';

import '../../../../core/error/failure.dart';

part 'app_info_state.dart';

class AppInfoCubit extends Cubit<AppInfoState> {
  AppInfoCubit(this._repo) : super(AppInfoInitial());

  final AppInfoRepo _repo;

  Future<void> fetchAppInfo() async {
    log('fetchAppInfo ===> is called');
    emit(AppInfoLoadingState());
    Either<Failure, Map<String, dynamic>> result = await _repo.fetchAppInfo();
    result.fold(
      (failure) => emit(AppInfoFailureState(errorMessage: failure.errorMsg)),
      (data) => emit(AppInfoSuccessState(info: data)),
    );
  }
}
