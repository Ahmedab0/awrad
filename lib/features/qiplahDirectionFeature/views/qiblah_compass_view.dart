import 'dart:math';

import 'package:awrad/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QiblahCompassView extends StatefulWidget {
  static const String routeNamed = 'QiblahCompassView';

  const QiblahCompassView({super.key});

  @override
  State<QiblahCompassView> createState() => _QiblahCompassViewState();
}

class _QiblahCompassViewState extends State<QiblahCompassView> {

  final Stream<QiblahDirection> _stream = FlutterQiblah.qiblahStream;

  @override
  void dispose() {
    FlutterQiblah().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _stream,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (snapshot.hasData && snapshot.data == null){
            return const Center(child: Text('No Data'),);
          } else if (snapshot.hasError) {
            return
              Center(child: Text('Error: ${snapshot.error}'),);
          } else {
            final qiblahDirection = snapshot.data;

            // north direction
            print('direction ==> ${qiblahDirection!.direction}');
            // qibla direction
            print('qiblah ==> ${qiblahDirection!.qiblah}');
            // qibla offset from the north
            print('offset ==> ${qiblahDirection!.offset}');

            return Stack(
              alignment: Alignment.center,
              children: [
                // Background
                Image.asset(
                  'assets/images/morebg.png',
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
                // bg vector
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
                Positioned(
                  top: 40,
                  child: Text(
                    '${qiblahDirection.qiblah.ceil()}°',
                    style: AppStyles.bold20(context),
                  ),
                ),
                Positioned(
                  top: 85,
                  child: SizedBox(
                    height: 61,
                    child: Image.asset(
                      'assets/images/mosque.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: Transform.rotate(
                    angle: (qiblahDirection.qiblah * (pi / 180) * -1),
                    child: SvgPicture.asset('assets/images/compass.svg'),
                  ),
                ),

               /* Transform.rotate(
                  angle: (qiblahDirection.qiblah * (pi / 180) * -1),
                  alignment: Alignment.center,
                  child: SvgPicture.asset('assets/images/compass/needle.svg',
                    fit: BoxFit.contain,
                    height: 240,
                    alignment: Alignment.center,
                  ),
                ),*/
              ],
            );



            /* Stack(
              children: [
                // Background
                Image.asset(
                  'assets/images/morebg.png',
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
                // bg vector
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 40),
                      Text(
                        '${qiblahDirection!.direction.toInt()} ْ ',
                        style: AppStyles.bold20(context),
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
                        height: 61,
                        child: Image.asset(
                          'assets/images/mosque.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 55),
                      //
                      AnimatedRotation(
                        //turns: (qiblahDirection!.qiblah * (pi / 180) * -1),
                        turns: (qiblahDirection.qiblah * (pi / 180) * -1),
                        duration: const Duration(milliseconds: 300),
                        child: AspectRatio(
                          aspectRatio: 1 / 1,
                          child: SizedBox(
                            height: 192,
                            child: SvgPicture.asset(
                              'assets/images/compass.svg', fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                )
              ],
            );*/
          }
        },);
  }
}

