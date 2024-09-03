import 'package:awrad/features/homeFeatures/views/widgets/dhikr_details_list_view.dart';
import 'package:flutter/material.dart';


class MorningDhikrsView extends StatelessWidget {
  static const String routeNamed = 'MorningDhikrsView';
  const MorningDhikrsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: DhikrDetailsListView(clr: Color(0xffE09326)),
    );
  }
}