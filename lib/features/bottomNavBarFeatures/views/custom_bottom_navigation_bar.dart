import 'package:awrad/core/utils/app_styles.dart';
import 'package:awrad/features/favouriteFeature/views/favourite_view.dart';
import 'package:awrad/features/bottomNavBarFeatures/views/widgets/custom_bottom_app_bar.dart';
import 'package:awrad/features/morningDhikrsFeature/views/morning_dhikrs_view.dart';
import 'package:awrad/features/nightDhikrsFeature/views/night_dhikrs_view.dart';
import 'package:flutter/material.dart';

import '../../homeFeatures/views/home_page_view.dart';
import '../../qiplahDirectionFeature/views/qiblah_compass_view.dart';

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
    {'title': 'أذكار المساء', 'page': const NightDhikrsView()},
    {'title': 'أذكار الصباح', 'page': const MorningDhikrsView()},
    {'page': const HomePage()},
    {'title': 'المفضلة', 'page': const FavouriteView()},
    {'title': 'القبلة ', 'page': const QiblahCompassView()},
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBody: true,
        appBar:
        selectedIndex == 2 ? null : selectedIndex == 0 || selectedIndex == 1 ? AppBar(
          title: Text(pages[selectedIndex]['title'],style: AppStyles.bold14(context).copyWith(color: Colors.white),),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
        ) : AppBar(
          title: Text(pages[selectedIndex]['title'],style: AppStyles.bold14(context).copyWith(color: Colors.white),),
          centerTitle: true,
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
      ),
    );
  }
}
