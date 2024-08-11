

import 'package:awrad/features/homeFeatures/views/widgets/dhikr_details_view.dart';
import 'package:awrad/features/homeFeatures/views/widgets/dhikr_item.dart';
import 'package:flutter/material.dart';

import '../models/dhikr_Model.dart';

class FavouriteView extends StatelessWidget {
  static const String routeNamed = 'FavouriteView';
  const FavouriteView({super.key});



  final List<DhikrModel> dhikrs = const [
    DhikrModel(title: 'ورد الاستغفار', description: 'ليس كثيرا علي الله ان يغفر لك', imgUrl: 'assets/images/dhikrsImg/dhikr6.png'),
    DhikrModel(title: 'ورد الاستغفار', description: 'ليس كثيرا علي الله ان يغفر لك', imgUrl: 'assets/images/dhikrsImg/dhikr7.png'),
    DhikrModel(title: 'ورد الاستغفار', description: 'ليس كثيرا علي الله ان يغفر لك', imgUrl: 'assets/images/dhikrsImg/dhikr8.png'),
    DhikrModel(title: 'ورد الاستغفار', description: 'ليس كثيرا علي الله ان يغفر لك', imgUrl: 'assets/images/dhikrsImg/dhikr9.png'),
    DhikrModel(title: 'ورد الاستغفار', description: 'ليس كثيرا علي الله ان يغفر لك', imgUrl: 'assets/images/dhikrsImg/dhikr10.png'),
    DhikrModel(title: 'ورد الاستغفار', description: 'ليس كثيرا علي الله ان يغفر لك', imgUrl: 'assets/images/dhikrsImg/dhikr1.png'),
    DhikrModel(title: 'ورد الاستغفار', description: 'ليس كثيرا علي الله ان يغفر لك', imgUrl: 'assets/images/dhikrsImg/dhikr2.png'),
    DhikrModel(title: 'ورد الاستغفار', description: 'ليس كثيرا علي الله ان يغفر لك', imgUrl: 'assets/images/dhikrsImg/dhikr3.png'),
    DhikrModel(title: 'ورد الاستغفار', description: 'ليس كثيرا علي الله ان يغفر لك', imgUrl: 'assets/images/dhikrsImg/dhikr4.png'),
    DhikrModel(title: 'ورد الاستغفار', description: 'ليس كثيرا علي الله ان يغفر لك', imgUrl: 'assets/images/dhikrsImg/dhikr5.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemCount: dhikrs.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.pushReplacementNamed(context, DhikrDetailsView.routeNamed,arguments: dhikrs[index]),
          child: SizedBox(
              height: 87,
              child: DhikrItem(dhikrModel: dhikrs[index], isFavourite: true,)),
        ),
      ),
    );
  }
}