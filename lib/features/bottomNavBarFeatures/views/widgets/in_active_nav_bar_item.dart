
import 'package:awrad/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../models/nav_bar_item_model.dart';

class InActiveNavBarItem extends StatelessWidget {

  final NavBarItemModel navBarItemModel;

  const InActiveNavBarItem({super.key, required this.navBarItemModel});


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(navBarItemModel.icon,color: AppStyles.darkGreyClr,),
        Text(navBarItemModel.label,style: AppStyles.regular10(context),),
      ],
    );
  }
}
