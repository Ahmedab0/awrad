import 'package:awrad/compass_view.dart';
import 'package:awrad/favourite_view.dart';
import 'package:awrad/features/splashfeature/views/splash_screen.dart';
import 'package:awrad/night_dhikrs_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'features/bottomNavBarFeatures/views/custom_bottom_navigation_bar.dart';
import 'features/homeFeatures/views/home_page_view.dart';
import 'features/moreFeature/view/app_info_details_view.dart';
import 'features/moreFeature/view/more_settings_view.dart';
import 'features/homeFeatures/views/widgets/dhikr_details_view.dart';
import 'morning_dhikrs_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff13A090)),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff13A090),
          foregroundColor: Colors.white
        )
      ),
      initialRoute: '/',
      routes: {
        '/' : (context)=> const SplashScreen(),
        CustomBottomNavigationBar.routeNamed : (context)=> const CustomBottomNavigationBar(),
        HomePage.routeNamed : (context)=> const HomePage(),
        NightDhikrsView.routeNamed : (context)=> const NightDhikrsView(),
        MorningDhikrsView.routeNamed : (context)=> const MorningDhikrsView(),
        FavouriteView.routeNamed : (context)=> const FavouriteView(),
        CompassView.routeNamed : (context)=> const CompassView(),
        MoreSettings.routeNamed : (context)=> const MoreSettings(),
        DhikrDetailsView.routeNamed : (context)=> const DhikrDetailsView(),
        AppInfoDetailsView.routeNamed : (context)=> const AppInfoDetailsView(),
      },
    );
  }
}

