import 'package:awrad/core/utils/app_styles.dart';
import 'package:awrad/features/homeFeatures/views/widgets/dhikr_details_list_view.dart';
import 'package:flutter/material.dart';


class NightDhikrsView extends StatelessWidget {
  static const String routeNamed = 'NightDhikrsView';
  const NightDhikrsView({super.key});

  
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: DhikrDetailsListView(clr: AppStyles.primaryClr),
    );
  }
}