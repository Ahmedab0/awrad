import 'package:flutter/material.dart';

class CircleArrowBack extends StatelessWidget {
  const CircleArrowBack({super.key, required this.clr, required this.iconSize});
  final Color clr;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 26,
      height: 26,
      decoration:
          BoxDecoration(shape: BoxShape.circle, border: Border.all(color: clr)),
      child: Center(
        child: Icon(
          Icons.arrow_forward_ios,
          color: clr,
          size: iconSize,
        ),
      ),
    );
  }
}
