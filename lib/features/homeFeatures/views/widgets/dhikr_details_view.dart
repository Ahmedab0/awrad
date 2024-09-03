import 'package:flutter/material.dart';

import '../../../../core/customWidgets/circle_arrow_back.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../bottomNavBarFeatures/views/custom_bottom_navigation_bar.dart';
import '../../data/models/dhikr_Model.dart';
import 'dhikr_details_list_view.dart';

class DhikrDetailsView extends StatelessWidget {
  static const routeNamed = 'DhikrDetailsView';

  const DhikrDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    DhikrModel dhikrModel =
        ModalRoute.of(context)!.settings.arguments as DhikrModel;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: InkWell(
                  onTap: () => Navigator.of(context).pushReplacementNamed(
                      CustomBottomNavigationBar.routeNamed),
                  child: const CircleArrowBack(
                    clr: Colors.white,
                    iconSize: 16,
                  ),
                ),
              ),
            ],
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border),
            ),
            centerTitle: true,
            title: Text(
              dhikrModel.title,
              style: AppStyles.bold14(context).copyWith(color: Colors.white),
            ),
          ),
          body: const Padding(
            padding: EdgeInsets.all(12.0),
            child: DhikrDetailsListView(clr: Color(0xffF22323),),
          )),
    );
  }
}
