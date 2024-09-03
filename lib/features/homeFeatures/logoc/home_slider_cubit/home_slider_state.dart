part of 'home_slider_cubit.dart';

@immutable
sealed class HomeSliderState {}

final class HomeSliderInitial extends HomeSliderState {}
final class HomeSliderLoadingState extends HomeSliderState {}
final class HomeSliderSuccessState extends HomeSliderState {
  final List<SliderModel> sliders;
  HomeSliderSuccessState({required this.sliders});
}
final class HomeSliderFailureState extends HomeSliderState {
  final String errorMessage;
  HomeSliderFailureState({required this.errorMessage});
}
