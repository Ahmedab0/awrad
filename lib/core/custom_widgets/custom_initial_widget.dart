import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class CustomInitialWidget extends StatelessWidget {
  const CustomInitialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                'assets/images/errorImage.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text('There Is No Data',style: AppStyles.bold10(context))
        ],
      ),
    );
  }
}
