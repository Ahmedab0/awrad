import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../main.dart';

class SplashScreen extends StatefulWidget {
  static const routeNamed = 'SplashScreen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    // Define the Animation Controller
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    // Define the fade animation
    _fadeAnimation = Tween<double>(begin: 0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    // Define the scale animation
    _scaleAnimation =
        Tween<double>(begin: 0.8, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.2, 1.0, curve: Curves.elasticOut),
    ));

    // Start the animation
    _controller.forward();

    // Navigate to the next screen after the animation is done
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacementNamed(context, HomePage.routeNamed);
      }
    });

    //Future.delayed(const Duration(seconds: 4),() => Navigator.pushReplacementNamed(context, HomePage.routeNamed));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            // Background image
            FadeTransition(
              opacity: _fadeAnimation,
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: ExactAssetImage('assets/images/splashCover.png'),
                        fit: BoxFit.cover)),
              ),
            ),
            // Gradient Layer
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage('assets/images/gradient.png'),
                      fit: BoxFit.cover)),
            ),
            // Frame Layer
            FadeTransition(
                opacity: _fadeAnimation,
                child: Image.asset('assets/images/splashFrame.png')),
            // Logo
            ScaleTransition(
              scale: _scaleAnimation,
              child: Center(
                child: AspectRatio(
                  aspectRatio: 200 / 305,
                  child: Center(
                      child: Image.asset(
                    'assets/images/splashLogo.png',
                    fit: BoxFit.fill,
                    width: 200,
                    height: 305,
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
