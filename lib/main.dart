import 'dart:developer';

import 'package:awrad/core/utils/service_locator.dart';
import 'package:awrad/features/homeFeatures/data/repos/home_repo_impl.dart';
import 'package:awrad/features/homeFeatures/logic/home_categories_cubit/home_categories_cubit.dart';
import 'package:awrad/features/homeFeatures/logic/home_slider_cubit/home_slider_cubit.dart';
import 'package:awrad/features/splashfeature/views/splash_screen.dart';
import 'package:awrad/features/nightDhikrsFeature/views/night_dhikrs_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/permission_handler.dart';
import 'features/bottomNavBarFeatures/views/custom_bottom_navigation_bar.dart';
import 'features/favouriteFeature/views/favorite_view.dart';
import 'features/homeFeatures/views/home_page_view.dart';
import 'features/qiplahDirectionFeature/views/qiblah_compass_view.dart';
import 'features/moreFeature/view/app_info_details_view.dart';
import 'features/moreFeature/view/more_settings_view.dart';
import 'features/homeFeatures/views/category_details_view.dart';
import 'features/morningDhikrsFeature/views/morning_dhikrs_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const MyApp(),
    ),
  );

  PermissionHandler().getPermission();
  setupServiceLocator();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height * 0.22;
    double width = MediaQuery.sizeOf(context).width;
    log('height: $height');
    log('width: $width');
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCategoriesCubit(getIt.get<HomeRepoImpl>())..fetchHomeCategories(),),
        BlocProvider(create: (context) =>HomeSliderCubit(getIt.get<HomeRepoImpl>())..fetchSlider(),
        ),
       // BlocProvider( create: (context) => FavCategoriesCubit(getIt.get<FavRepoImpl>())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0xff13A090)),
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xff13A090),
              foregroundColor: Colors.white,
            )),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          CustomBottomNavigationBar.routeNamed: (context) =>
              const CustomBottomNavigationBar(),
          HomePage.routeNamed: (context) => const HomePage(),
          NightDhikrsView.routeNamed: (context) => const NightDhikrsView(),
          MorningDhikrsView.routeNamed: (context) => const MorningDhikrsView(),
          FavoriteView.routeNamed: (context) => const FavoriteView(),
          QiblahCompassView.routeNamed: (context) => const QiblahCompassView(),
          MoreSettings.routeNamed: (context) => const MoreSettings(),
          CategoryDetailsView.routeNamed: (context) =>
              const CategoryDetailsView(),
          AppInfoDetailsView.routeNamed: (context) =>
              const AppInfoDetailsView(),
        },
      ),
    );
  }
}
