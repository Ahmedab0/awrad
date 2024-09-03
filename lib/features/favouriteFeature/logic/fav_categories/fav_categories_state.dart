part of 'fav_categories_cubit.dart';

@immutable
sealed class FavCategoriesState {}

final class FavCategoriesInitial extends FavCategoriesState {}
final class FavCategoriesLoadingState extends FavCategoriesState {}
final class FavCategoriesSuccessState extends FavCategoriesState {
  final List<FavCategoryModel> favList;
  FavCategoriesSuccessState({required this.favList});
}
final class FavCategoriesFailureState extends FavCategoriesState {
  final String errorMessage;
  FavCategoriesFailureState({required this.errorMessage});
}
