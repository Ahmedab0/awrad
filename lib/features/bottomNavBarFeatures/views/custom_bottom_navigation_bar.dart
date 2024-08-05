import 'package:awrad/compass_view.dart';
import 'package:awrad/core/utils/app_styles.dart';
import 'package:awrad/favourite_view.dart';
import 'package:awrad/features/bottomNavBarFeatures/views/widgets/custom_bottom_app_bar.dart';
import 'package:awrad/morning_dhikrs_view.dart';
import 'package:awrad/night_dhikrs_view.dart';
import 'package:flutter/material.dart';

import '../../homeFeatures/views/home_page_view.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  static const String routeNamed = 'CustomBottomNavigationBar';

  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 2;

  List<Map<String, dynamic>> pages = [
    {'title': 'Night Dhikrs', 'page': const NightDhikrsView()},
    {'title': 'Morning Dhikrs', 'page': const MorningDhikrsView()},
    {'page': const HomePage()},
    {'title': 'Favourite', 'page': const FavouriteView()},
    {'title': 'Compass ', 'page': const CompassView()},
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: selectedIndex == 2 ? null : AppBar(
        title: Text(pages[selectedIndex]['title']),
      ),
      body: pages[selectedIndex]['page'],
      bottomNavigationBar: CustomBottomAppBar(
        selectedItem: selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 64,
        height: 64,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: AppStyles.primaryClr),
        child: InkWell(
          onTap: ()=> _onItemTapped(2),
          child: const Icon(
            Icons.home,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
