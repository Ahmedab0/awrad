import 'package:awrad/core/utils/app_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/custom_widgets/circle_arrow_back.dart';
import '../../data/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryItem({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // image
            AspectRatio(
              aspectRatio: 88 / 68,
              child: SizedBox(
                height: 68,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: CachedNetworkImage(
                    imageUrl: categoryModel.image ??
                        "https://i0.wp.com/ourscene.org/wp-content/uploads/2022/01/placeholder-2.png?fit=1200%2C800&ssl=1", // if cateImg is null
                    fit: BoxFit.fill,
                    placeholder: (context, url) => Image.asset(
                      'assets/images/splashLogo.png',
                      fit: BoxFit.fill,
                    ), //const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Center(
                        child: Image.asset(
                      'assets/images/noData.png',
                      fit: BoxFit.fill,
                    )), //Icon(Icons.error),
                  ),
                ),
                /*Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(categoryModel.image ?? 'assets/images/noData.png'),
                      )),
                ),*/
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
                    categoryModel.name ?? 'Award Test Title',
                    style: AppStyles.bold14(context)
                        .copyWith(overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    categoryModel.description ?? 'Award Test Description',
                    style: AppStyles.regular11(context)
                        .copyWith(overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            ),
            // arrow icon
            const CircleArrowBack(
              clr: Color(0xff838BA5),
              iconSize: 12,
            ),
          ],
        ),
      ),
    );
  }
}
