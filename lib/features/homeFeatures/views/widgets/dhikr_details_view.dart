import 'package:awrad/features/homeFeatures/models/dhikr_Model.dart';
import 'package:flutter/material.dart';

import '../../../../core/customWidgets/circle_arrow_back.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../bottomNavBarFeatures/views/custom_bottom_navigation_bar.dart';

class DhikrDetailsView extends StatelessWidget {
  static const routeNamed = 'DhikrDetailsView';

  const DhikrDetailsView({super.key});

  @override
  Widget build(BuildContext context) {

    DhikrModel dhikrModel = ModalRoute.of(context)!.settings.arguments as DhikrModel;


    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
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
          dhikrModel.title,
          style: AppStyles.bold14(context).copyWith(color: Colors.white),
        ),
      ),
    ));
  }
}
