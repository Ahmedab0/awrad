import 'package:awrad/features/homeFeatures/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String routeNamed = 'HomePage';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
        textDirection: TextDirection.rtl,
        child: HomeViewBody());
  }
}