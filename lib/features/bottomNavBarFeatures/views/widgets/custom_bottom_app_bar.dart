import 'package:flutter/material.dart';

import '../../models/nav_bar_item_model.dart';
import 'custom_nav_bar_item.dart';

class CustomBottomAppBar extends StatelessWidget {
  final int selectedItem;
  final Function(int) onItemTapped;

  const CustomBottomAppBar({
    super.key,
    required this.selectedItem,
    required this.onItemTapped,
  });

   final List<NavBarItemModel> navItems =  const [
    NavBarItemModel(icon: Icons.nights_stay, label: 'أذكار المساء'),
    NavBarItemModel(icon: Icons.wb_sunny, label: 'أذكار الصباح'),
    NavBarItemModel(icon: null, label: 'الرئيسية'),
    NavBarItemModel(icon: Icons.favorite, label: 'المفضلة'),
    NavBarItemModel(icon: Icons.compass_calibration_outlined, label: 'اتجاة القبلة'),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: SizedBox(
        height: 80.0,
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildNavBarItem(0),
                  buildNavBarItem(1),
                ],
              ),
            ),
            buildNavBarItem(2),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  buildNavBarItem(3),
                  buildNavBarItem(4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  // buildNavBarItem method
  Widget buildNavBarItem(int index) {
    return Expanded(
      child: InkWell(
        onTap: () {
          onItemTapped(index);
        },
        child: CustomNavBarItem(
          navBarItemModel: navItems[index],
          isActive: selectedItem == index,
        ),
      ),
    );
  }
}
