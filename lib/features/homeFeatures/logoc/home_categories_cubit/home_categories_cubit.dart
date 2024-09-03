
import 'dart:developer';

import 'package:awrad/core/error/failure.dart';
import 'package:awrad/features/homeFeatures/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/category_model.dart';

part 'home_categories_state.dart';

class HomeCategoriesCubit extends Cubit<HomeCategoriesState> {
  HomeCategoriesCubit(this._homeRepo) : super(HomeCategoriesInitial());

  final HomeRepo _homeRepo;

  Future<void> fetchHomeCategories() async {
    log('fetchHomeCategories ===> is called');
    emit(HomeCategoriesLoadingState());
    Either<Failure, List<CategoryModel>> result = await _homeRepo.fetchHomeCategories();
    result.fold((failure){
      emit(HomeCategoriesFailureState(errorMessage: failure.errorMsg));
    }, (categories){
      emit(HomeCategoriesSuccessState(categories: categories));
    });
  }


}
