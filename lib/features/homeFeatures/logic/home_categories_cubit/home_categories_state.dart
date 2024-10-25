part of 'home_categories_cubit.dart';

sealed class HomeCategoriesState {}

final class HomeCategoriesInitial extends HomeCategoriesState {}

final class HomeCategoriesLoadingState extends HomeCategoriesState {}

final class HomeCategoriesFailureState extends HomeCategoriesState {
  final String errorMessage;
  HomeCategoriesFailureState({required this.errorMessage});
}

final class HomeCategoriesSuccessState extends HomeCategoriesState {
  final List<CategoryModel> categories;
  HomeCategoriesSuccessState({required this.categories});
}
