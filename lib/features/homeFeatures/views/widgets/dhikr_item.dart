import 'package:awrad/core/utils/app_styles.dart';
import 'package:awrad/features/homeFeatures/models/dhikr_Model.dart';
import 'package:flutter/material.dart';

import '../../../../core/customWidgets/circle_arrow_back.dart';

class DhikrItem extends StatelessWidget {
  const DhikrItem({super.key, required this.dhikrModel});

  final DhikrModel dhikrModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // image
            GestureDetector(
              onTap: () async {
                await showDialog(context: context, builder: (context) => AlertDialog(
                  content: Center(child: Image.asset(dhikrModel.imgUrl, fit: BoxFit.fill,),),
                ));
              },
              child: AspectRatio(
                aspectRatio: 88 / 68,
                child: SizedBox(
                  height: 68,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(dhikrModel.imgUrl),
                        )),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Title & description
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dhikrModel.title,
                    style: AppStyles.bold14(context)
                        .copyWith(overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    dhikrModel.description,
                    style: AppStyles.regular11(context)
                        .copyWith(overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            ),
            // arrow icon
            const CircleArrowBack(clr: Color(0xff838BA5), iconSize: 12,),
          ],
        ),
      ),
    );
  }
}
