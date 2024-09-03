part of 'about_app_cubit.dart';

@immutable
sealed class AboutAppState {}

final class AboutAppInitial extends AboutAppState {}
final class AboutAppLoadingState extends AboutAppState {}
final class AboutAppSuccessState extends AboutAppState {
  final AboutAppModel aboutAppModel;
  AboutAppSuccessState({required this.aboutAppModel});
}
final class AboutAppFailureState extends AboutAppState {
  final String errorMessage;
  AboutAppFailureState({required this.errorMessage});
}
