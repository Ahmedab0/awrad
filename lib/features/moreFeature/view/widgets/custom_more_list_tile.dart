import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';

class CustomMoreListTile extends StatelessWidget {

  final String title;
  final IconData icon;

  const CustomMoreListTile({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(title,style: AppStyles.regular13(context),),
          leading: CircleAvatar(
            radius: 12,
            child: Icon(icon,size: 16),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
