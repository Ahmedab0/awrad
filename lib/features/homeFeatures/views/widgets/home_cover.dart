import 'package:awrad/features/homeFeatures/views/more_settings.dart';
import 'package:flutter/material.dart';

class HomeCover extends StatelessWidget {
  const HomeCover({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await showDialog(context: context, builder: (context) => AlertDialog(
          content: Center(child: Image.asset('assets/images/homeCover.png'),),
        ));
      },
      child: Stack(
        children: [
          // Home Cover
          AspectRatio(
            aspectRatio: 375 / 250,
            child: SizedBox(
              height: 250,
              child: Image.asset('assets/images/homeCover.png'),
            ),
          ),
          // Settings
          Positioned(
            top: 45,
            left: 20,
            child: InkWell(
              onTap: () => Navigator.of(context).pushReplacementNamed(MoreSettings.routeNamed),
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: const Color(0xff06353E),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(
                  Icons.settings_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // App Logo
          Positioned(
            top: 65,
              right: 25,
              child: SizedBox(
                height: 105,
                child: Image.asset('assets/images/splashLogo.png',fit: BoxFit.fill,),
              ),),
        ],
      ),
    );
  }
}

