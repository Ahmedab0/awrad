import 'package:flutter/material.dart';

class HomeCover extends StatelessWidget {
  const HomeCover({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 375 / 250,
          child: SizedBox(
            height: 250,
            child: Image.asset('assets/images/homeCover.png'),
          ),
        ),
      ],
    );
  }
}
