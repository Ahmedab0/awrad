import 'package:awrad/core/utils/app_styles.dart';
import 'package:awrad/features/moreFeature/view/widgets/more_settings_body.dart';
import 'package:flutter/material.dart';

import '../../../core/customWidgets/circle_arrow_back.dart';
import '../../bottomNavBarFeatures/views/custom_bottom_navigation_bar.dart';

class MoreSettings extends StatelessWidget {
  static const String routeNamed = 'MoreSettings';

  const MoreSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: InkWell(
                onTap: () => Navigator.of(context)
                    .pushReplacementNamed(CustomBottomNavigationBar.routeNamed),
                child: const CircleArrowBack(
                  clr: Colors.white, iconSize: 16,
                ),
              ),
            ),
          ],
          centerTitle: true,
          title: Text(
            'المزيد',
            style: AppStyles.bold14(context).copyWith(color: Colors.white),
          ),
        ),
        body: const MoreSettingsBody(),
      ),
    );
  }
}



