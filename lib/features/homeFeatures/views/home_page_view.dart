import 'package:awrad/features/homeFeatures/logic/home_slider_cubit/home_slider_cubit.dart';
import 'package:awrad/features/homeFeatures/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  static const String routeNamed = 'HomePage';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        if (context.mounted) {
          await BlocProvider.of<HomeSliderCubit>(context).fetchSlider();
          //await BlocProvider.of<HomeCategoriesCubit>(context).fetchHomeCategories();
        }
      },
      child: const Directionality(
        textDirection: TextDirection.rtl,
        child: HomeViewBody(),
      ),
    );
  }
}
