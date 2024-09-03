import 'dart:developer';

import 'package:awrad/core/error/failure.dart';
import 'package:awrad/features/homeFeatures/data/repos/home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../data/models/Slider_model.dart';

part 'home_slider_state.dart';

class HomeSliderCubit extends Cubit<HomeSliderState> {
  HomeSliderCubit(this._homeRepo) : super(HomeSliderInitial());

  final HomeRepo _homeRepo;

  Future<void> fetchSlider() async {
    log('fetchSlider ===> is called');
    emit(HomeSliderLoadingState());
    Either<Failure, List<SliderModel>> result = await _homeRepo.fetchSliders();
    result.fold((failure){
      emit(HomeSliderFailureState(errorMessage: failure.errorMsg));
    }, (sliders){
      emit(HomeSliderSuccessState(sliders: sliders));
    });

  }

}
