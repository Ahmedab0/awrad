
import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';

class DhikrDetailsItem extends StatelessWidget {
  const DhikrDetailsItem({super.key, required this.title, required this.description, required this.index});

  final String title, description;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('﴾ ${index+1} ﴿',style: AppStyles.traditionalMedium21(context),textDirection: TextDirection.ltr,textAlign: TextAlign.center,),
        const SizedBox(height: 12),
        Text(title,style: AppStyles.traditionalRegular19(context),textDirection: TextDirection.rtl,textAlign: TextAlign.center,),
        const SizedBox(height: 6),
        Text(description,style: AppStyles.traditionalMedium12(context),textAlign: TextAlign.center,),
        const SizedBox(height: 24),
      ],
    );
  }
}
