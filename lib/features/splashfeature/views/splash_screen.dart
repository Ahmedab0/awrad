import 'package:awrad/core/utils/app_styles.dart';
import 'package:awrad/main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const routeNamed = 'SplashScreen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 3000),
        () => Navigator.pushReplacementNamed(context, HomePage.routeNamed));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Splash Screen',
          style: AppStyles.bold20(context),
        ),
      ),
    );
  }
}
