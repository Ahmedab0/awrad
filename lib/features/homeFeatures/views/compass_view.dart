
import 'package:awrad/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CompassView extends StatefulWidget {
  static const String routeNamed = 'CompassView';
  const CompassView({super.key});

  @override
  State<CompassView> createState() => _CompassViewState();
}

class _CompassViewState extends State<CompassView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Stack(
        //alignment: Alignment.topCenter,
        children: [
          // Background
          AspectRatio(
            aspectRatio: 115 / 175,
            child: Container(
              height: 175,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: ExactAssetImage('assets/images/morebg.png'),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AspectRatio(
              aspectRatio: 350 / 191,
              child: Container(
                height: 191,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: ExactAssetImage('assets/images/moreVector.png'),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('S 120',style: AppStyles.bold20(context),),
                const SizedBox(height: 40),
                SizedBox(
                  height: 61,
                  child: Image.asset('assets/images/mosque.png',fit: BoxFit.fill,),
                ),
                const SizedBox(height: 50),
                AspectRatio(
                  aspectRatio: 1 / 1,
                  child: SizedBox(
                      height: 100,
                      child: Image.asset('assets/images/compass.png',fit: BoxFit.contain)),
                ),

                /// using flutter compass

              ],
            ),
          )
        ],
      ),
    );
  }
}
