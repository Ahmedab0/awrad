part of 'toggle_fav_cubit.dart';

@immutable
sealed class ToggleFavState {}

final class ToggleFavInitial extends ToggleFavState {}
final class ToggleFavSuccess extends ToggleFavState {}
final class ToggleFavLoading extends ToggleFavState {}
final class ToggleFavFailure extends ToggleFavState {}
