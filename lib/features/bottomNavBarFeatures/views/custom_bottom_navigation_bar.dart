import 'package:awrad/core/utils/app_styles.dart';
import 'package:awrad/features/bottomNavBarFeatures/views/models/nav_bar_item_model.dart';
import 'package:awrad/features/bottomNavBarFeatures/views/widgets/custom_nav_bar_item.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  static const String routeNamed = 'CustomBottomNavigationBar';

  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Awrad'),
      ),
      bottomNavigationBar: CustomBottomAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 64,
        height: 64,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: AppStyles.primaryClr),
        child: GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.home,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}


class CustomBottomAppBar extends StatefulWidget {
  const CustomBottomAppBar({super.key});

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {

  List<NavBarItemModel> navItems = [
    NavBarItemModel(icon: Icons.nights_stay, label: 'أذكار المساء'),
    NavBarItemModel(icon: Icons.wb_sunny, label: 'أذكار الصباح'),
    NavBarItemModel(icon: null, label: 'الرئيسية'),
    NavBarItemModel(icon: Icons.favorite, label: 'المفضلة'),
    NavBarItemModel(icon: Icons.compass_calibration_outlined, label: 'القبلة'),
  ];

  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: SizedBox(
        height: 80.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: (){
                setState(() {
                  if (selectedItem != 0) {
                    setState(() {
                      selectedItem = 0;
                    });
                  }
                });
              },
              child: CustomNavBarItem(navBarItemModel: navItems[0], isActive: selectedItem == 0,),
            ),
            InkWell(
              onTap: (){
                setState(() {
                  if (selectedItem != 1) {
                    setState(() {
                      selectedItem = 1;
                    });
                  }
                });
              },
              child: CustomNavBarItem(navBarItemModel: navItems[1], isActive: selectedItem == 1,),
            ),
            InkWell(
              onTap: (){
                setState(() {
                  if (selectedItem != 2) {
                    setState(() {
                      selectedItem = 2;
                    });
                  }
                });
              },
              child: CustomNavBarItem(navBarItemModel: navItems[2], isActive: selectedItem == 2,),
            ),
            InkWell(
              onTap: (){
                setState(() {
                  if (selectedItem != 3) {
                    setState(() {
                      selectedItem = 3;
                    });
                  }
                });
              },
              child: CustomNavBarItem(navBarItemModel: navItems[3], isActive: selectedItem == 3,),
            ),
            InkWell(
              onTap: (){
                setState(() {
                  if (selectedItem != 4) {
                    setState(() {
                      selectedItem = 4;
                    });
                  }
                });
              },
              child: CustomNavBarItem(navBarItemModel: navItems[4], isActive: selectedItem == 4,),
            ),

          ],
        ),
      ),
    );
  }
}



