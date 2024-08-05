
import 'package:awrad/features/homeFeatures/views/widgets/dhikr_item.dart';
import 'package:flutter/material.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: DhikrItem(),//Container(height: 200,color: Colors.red,),
      ),
    );
  }
}
