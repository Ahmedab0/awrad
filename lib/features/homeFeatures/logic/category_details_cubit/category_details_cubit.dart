import 'package:awrad/core/error/failure.dart';
import 'package:awrad/features/homeFeatures/data/models/category_azkar_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/home_repo.dart';

part 'category_details_state.dart';

class CategoryDetailsCubit extends Cubit<CategoryDetailsState> {
  CategoryDetailsCubit(this._homeRepo) : super(CategoryDetailsInitial());
  final HomeRepo _homeRepo;

  // post Category Azkar
  fetchCategoryDetails({required int catId}) async {
    emit(CategoryDetailsLoading());
    Either<Failure, List<CategoryAzkarModel>> result =
        await _homeRepo.fetchCategoriesAzkar(catId);
    result.fold((failure) {
      emit(CategoryDetailsFailure(failure.errorMsg));
    }, (items) {
      emit(CategoryDetailsSuccess(items));
    });
  }
}
