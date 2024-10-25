part of 'fav_azkars_cubit.dart';

@immutable
sealed class FavAzkarsState {}

final class FavAzkarsInitial extends FavAzkarsState {}
final class FavAzkarsLoading extends FavAzkarsState {}

final class FavAzkarsSuccess extends FavAzkarsState {
  final List<CategoryAzkarModel> favAzkars;

  FavAzkarsSuccess({required this.favAzkars});
}
final class FavAzkarsFailure extends FavAzkarsState {
  final String errorMessage;

  FavAzkarsFailure({required this.errorMessage});
}
