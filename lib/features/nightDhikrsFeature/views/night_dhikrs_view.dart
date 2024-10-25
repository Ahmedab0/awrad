import 'package:awrad/core/custom_widgets/custom_initial_widget.dart';
import 'package:flutter/material.dart';

class NightDhikrsView extends StatelessWidget {
  static const String routeNamed = 'NightDhikrsView';
  const NightDhikrsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: CustomInitialWidget(),
      //CategoryDetailsListView(clr: AppStyles.primaryClr),
    );
  }
}
