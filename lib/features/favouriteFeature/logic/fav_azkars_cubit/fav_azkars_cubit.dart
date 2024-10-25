import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
//import 'package:uuid/uuid.dart';

import '../../../../core/error/failure.dart';
import '../../../homeFeatures/data/models/category_azkar_model.dart';
import '../../data/repo/fav_repo.dart';

part 'fav_azkars_state.dart';

class FavAzkarsCubit extends Cubit<FavAzkarsState> {
  FavAzkarsCubit(this._favRepo) : super(FavAzkarsInitial());

  final FavRepo _favRepo;
  //var uuid = const Uuid().v1();

  void fetchFavAzkars() async {
    log('fetchFavAzkars ===> is called');
    emit(FavAzkarsLoading());
    Either<Failure, List<CategoryAzkarModel>> result =
        await _favRepo.fetchFavAzkars();
    result.fold(
      (failure) => emit(FavAzkarsFailure(errorMessage: failure.errorMsg)),
      (favAzkars) => emit(FavAzkarsSuccess(favAzkars: favAzkars)),
    );
    log('*** Fav Azkars Done from cubit ***');
  }
}
