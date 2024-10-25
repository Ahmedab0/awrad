import 'package:awrad/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../models/nav_bar_item_model.dart';

class ActiveNavBarItem extends StatelessWidget {
  final NavBarItemModel navBarItemModel;

  const ActiveNavBarItem({super.key, required this.navBarItemModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          navBarItemModel.icon,
          color: AppStyles.primaryClr,
        ),
        Text(navBarItemModel.label, style: AppStyles.bold10(context)),
      ],
    );
  }
}
