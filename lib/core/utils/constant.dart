
import 'package:uuid/uuid.dart';

class Constant {
  var uuid = const Uuid().v4();

  final String baseUrl = 'https://awradapp.com/api/';
  final String homePage = "homePage";
  final String aboutApp = "aboutApp";
  final String categoryAzkar = "categoryAzkar";
  final String toggleFav = "toggleFav";
  final String favAzkars = "favAzkars";
}