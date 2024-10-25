part of 'app_info_cubit.dart';

class AppInfoState {}

final class AppInfoInitial extends AppInfoState {}

final class AppInfoLoadingState extends AppInfoState {}

final class AppInfoSuccessState extends AppInfoState {
  final Map<String, dynamic> info;
  AppInfoSuccessState({required this.info});
}

final class AppInfoFailureState extends AppInfoState {
  final String errorMessage;
  AppInfoFailureState({required this.errorMessage});
}
