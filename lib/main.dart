import 'package:awrad/core/utils/app_styles.dart';
import 'package:awrad/features/splashfeature/views/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
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
        HomePage.routeNamed : (context)=> const HomePage(),
      },
      //home: const HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  static const routeNamed = 'HomePage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Awrad'),
        centerTitle: true,
      ),
      body: Center(child: Text('Home Page',style: AppStyles.regular13(context),)),

    );
  }
}
