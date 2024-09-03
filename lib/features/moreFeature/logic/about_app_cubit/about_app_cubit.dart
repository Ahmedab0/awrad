import 'dart:developer';

import 'package:awrad/core/error/failure.dart';
import 'package:awrad/features/moreFeature/data/repos/settings_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../data/models/about_app_model.dart';



part 'about_app_state.dart';

class AboutAppCubit extends Cubit<AboutAppState> {
  AboutAppCubit(this._settingRepo) : super(AboutAppInitial());
  final SettingsRepo _settingRepo;

  Future<void> fetchAppInfo() async {
    log('fetchAppInfo ===> is called');
    emit(AboutAppLoadingState());
   Either<Failure, AboutAppModel> result = await _settingRepo.fetchAppInfo();
    result.fold((failure){
      emit(AboutAppFailureState(errorMessage: failure.errorMsg));
    }, (aboutAppModel){
      emit(AboutAppSuccessState(aboutAppModel: aboutAppModel));
    });
  }
}
