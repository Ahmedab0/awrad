
import 'package:awrad/core/utils/app_styles.dart';
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
      bottomNavigationBar: const BottomAppBar(
        shape: CircularNotchedRectangle(),
       notchMargin: 8.0,
        child: SizedBox(
          height: 80.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(child: CustomNavBarItem(icon: Icons.nights_stay, label: 'أذكار المساء',)),
              Expanded(child: CustomNavBarItem(icon: Icons.wb_sunny, label: 'أذكار الصباح',)),
              Expanded(child: CustomNavBarItem(icon: null, label: 'الرئيسية',)),
              Expanded(child: CustomNavBarItem(icon: Icons.favorite, label: 'المفضلة',)),
              Expanded(child: CustomNavBarItem(icon: Icons.compass_calibration, label: 'القبلة',)),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
                color: AppStyles.primaryClr
          ),
        child: GestureDetector(
          onTap: () {},
          child: const Icon(Icons.home,color: Colors.white,),
        ),
      ),
    );
  }
}

class CustomNavBarItem extends StatelessWidget {
  const CustomNavBarItem({super.key, required this.icon, required this.label});
  final IconData? icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon),
          Text(label),
        ],
      ),
    );
  }
}
