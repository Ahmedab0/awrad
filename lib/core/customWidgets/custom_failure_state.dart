import 'package:awrad/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomFailureState extends StatelessWidget {
  const CustomFailureState({super.key, required this.errorText, required this.onPressed});
  final String errorText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          CircleAvatar(
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child:
              Image.asset('assets/images/errorImage.png', fit: BoxFit.fill,),
            ),
          ),
          TextButton.icon(
            onPressed: onPressed,
            label: Text('$errorText, Refresh',
              style: AppStyles.bold10(context),
            ),
            icon: Icon(
              Icons.refresh,
              color: AppStyles.primaryClr,
            ),
          ),
        ],
      ),
    );
  }
}