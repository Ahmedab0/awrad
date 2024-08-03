import 'package:awrad/features/bottomNavBarFeatures/views/models/nav_bar_item_model.dart';
import 'package:awrad/features/bottomNavBarFeatures/views/widgets/active_nav_bar_item.dart';
import 'package:awrad/features/bottomNavBarFeatures/views/widgets/in_active_nav_bar_item.dart';
import 'package:flutter/material.dart';

class CustomNavBarItem extends StatelessWidget {

  const CustomNavBarItem({super.key, required this.navBarItemModel, required this.isActive});

  final NavBarItemModel navBarItemModel;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 500),
      firstChild: ActiveNavBarItem(navBarItemModel: navBarItemModel),
      secondChild: InActiveNavBarItem(navBarItemModel: navBarItemModel),
      crossFadeState:
      isActive ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }


}