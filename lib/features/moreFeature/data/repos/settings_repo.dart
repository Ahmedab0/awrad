import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../models/about_app_model.dart';

abstract class SettingsRepo {
  Future<Either<Failure, AboutAppModel>> fetchAppInfo();
}
