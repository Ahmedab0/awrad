
import 'package:awrad/features/homeFeatures/views/widgets/home_cover.dart';
import 'package:awrad/features/homeFeatures/views/widgets/home_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HomeCover(),
        SizedBox(height: 16),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: HomeListView(),
          ),
        ),
      ],
    );
  }
}
