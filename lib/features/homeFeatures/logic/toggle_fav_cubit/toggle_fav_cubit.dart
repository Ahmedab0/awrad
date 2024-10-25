import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failure.dart';
import '../../data/repos/home_repo.dart';

part 'toggle_fav_state.dart';

class ToggleFavCubit extends Cubit<ToggleFavState> {
  ToggleFavCubit(this._homeRepo) : super(ToggleFavInitial());
  final HomeRepo _homeRepo;

  // toggle Favorite
  toggleFavorite(int azkarId) async {
    emit(ToggleFavLoading());
    Either<Failure, Map<String, dynamic>> result =
        await _homeRepo.toggleFavorite(azkarId);
    result.fold(
      (failure) => emit(ToggleFavFailure()),
      (success) => emit(ToggleFavSuccess()),
    );
  }
}
