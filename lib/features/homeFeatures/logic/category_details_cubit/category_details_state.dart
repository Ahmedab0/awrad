part of 'category_details_cubit.dart';

sealed class CategoryDetailsState {}

final class CategoryDetailsInitial extends CategoryDetailsState {}

final class CategoryDetailsSuccess extends CategoryDetailsState {
  final List items;

  CategoryDetailsSuccess(this.items);
}

final class CategoryDetailsFailure extends CategoryDetailsState {
  final String errorMsg;

  CategoryDetailsFailure(this.errorMsg);
}

final class CategoryDetailsLoading extends CategoryDetailsState {}
