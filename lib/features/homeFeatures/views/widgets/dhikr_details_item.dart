
import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';
import '../../models/dhikr_details_item_model.dart';

class DhikrDetailsItem extends StatelessWidget {
  const DhikrDetailsItem({super.key, required this.dhikrDetailsItemModel, required this.index, required this.clr});

  final DhikrDetailsItemModel dhikrDetailsItemModel;
  final int index;
  final Color clr;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('﴾ ${index+1} ﴿',style: AppStyles.traditionalMedium21(context).copyWith(color: clr),textDirection: TextDirection.ltr,textAlign: TextAlign.center,),
        const SizedBox(height: 12),
        Text(dhikrDetailsItemModel.title,style: AppStyles.traditionalRegular19(context),textDirection: TextDirection.rtl,textAlign: TextAlign.center,),
        const SizedBox(height: 6),
        Text(dhikrDetailsItemModel.description,style: AppStyles.traditionalMedium12(context),textAlign: TextAlign.center,),
        const SizedBox(height: 24),
      ],
    );
  }
}
