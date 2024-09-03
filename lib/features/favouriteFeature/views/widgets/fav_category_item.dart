

import 'package:awrad/features/favouriteFeature/data/models/Fav_category_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';

class FavCategoryItem extends StatelessWidget {
  const FavCategoryItem({super.key, required this.favCategoryModel});

  final FavCategoryModel favCategoryModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            AspectRatio(
              aspectRatio: 88 / 68,
              child: SizedBox(
                height: 68,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: CachedNetworkImage(
                    imageUrl: favCategoryModel.image ?? "https://i0.wp.com/ourscene.org/wp-content/uploads/2022/01/placeholder-2.png?fit=1200%2C800&ssl=1",
                    fit: BoxFit.fill,
                    placeholder: (context, url) => Image.asset('assets/images/splashLogo.png',fit: BoxFit.fill,),//const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Center(child: Image.asset('assets/images/noData.png',fit: BoxFit.fill,)),//Icon(Icons.error),
                  ),
                ),
                /*  Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(categoryModel.image ),
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
                    favCategoryModel.name ?? 'Award Test Title',
                    style: AppStyles.bold14(context)
                        .copyWith(overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    favCategoryModel.description ?? 'Award Test Description',
                    style: AppStyles.regular11(context)
                        .copyWith(overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.favorite,
              color: AppStyles.darkRedClr,
            ),
          ],
        ),
      ),
    );
  }
}
