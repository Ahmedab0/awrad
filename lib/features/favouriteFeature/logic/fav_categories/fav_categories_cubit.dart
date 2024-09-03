import 'dart:developer';

import 'package:awrad/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/Fav_category_model.dart';
import '../../data/repo/fav_repo.dart';

part 'fav_categories_state.dart';

class FavCategoriesCubit extends Cubit<FavCategoriesState> {
  FavCategoriesCubit(this._favRepo) : super(FavCategoriesInitial());

  final FavRepo _favRepo;

   void fetchFavCategories () async {
     log('fetchFavCategories ===> is called');
     emit(FavCategoriesLoadingState());
    Either<Failure, List<FavCategoryModel>> result = await _favRepo.fetchFavCategories();
    result.fold((failure){
      emit(FavCategoriesFailureState(errorMessage: failure.errorMsg));
    }, (favourites){
      emit(FavCategoriesSuccessState(favList: favourites));
    });
  }

}
