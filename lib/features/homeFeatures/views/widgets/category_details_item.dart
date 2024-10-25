import 'package:awrad/core/utils/service_locator.dart';
import 'package:awrad/features/homeFeatures/logic/toggle_fav_cubit/toggle_fav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_styles.dart';
import '../../data/models/category_azkar_model.dart';
import '../../data/repos/home_repo_impl.dart';

class CategoryDetailsItem extends StatefulWidget {
  final CategoryAzkarModel categoryAzkarModel;
  final int index;
  final Color clr;

  const CategoryDetailsItem({super.key,
    required this.categoryAzkarModel,
    required this.index,
    required this.clr});

  @override
  State<CategoryDetailsItem> createState() => _CategoryDetailsItemState();
}

class _CategoryDetailsItemState extends State<CategoryDetailsItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Column(
              children: [
                Text(
                  '﴾ ${widget.index + 1} ﴿', //traditionalMedium21
                  style: AppStyles.traditionalRegular19(context)
                      .copyWith(color: widget.clr),
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  widget.categoryAzkarModel.title!,
                  style: AppStyles.traditionalRegular19(context),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                Text(
                  widget.categoryAzkarModel.content!,
                  style: AppStyles.traditionalMedium12(context),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
              ],
            ),
            // Favorite Button
            Positioned(
              top: 0,
              right: 0,
              child: BlocProvider(
                create: (context) => ToggleFavCubit(getIt.get<HomeRepoImpl>()),
                child: Builder(
                  builder: (context) {
                    return IconButton(
                      onPressed: () {
                        BlocProvider.of<ToggleFavCubit>(context).toggleFavorite(
                            widget.categoryAzkarModel.id!);
                        setState(() {
                          widget.categoryAzkarModel.isFav = !widget.categoryAzkarModel.isFav!;
                        });
                      },
                      icon: Icon(
                          widget.categoryAzkarModel.isFav!
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: widget.categoryAzkarModel.isFav!
                              ? AppStyles.darkRedClr
                              : AppStyles.primaryClr),
                    );
                  }
                ),
              ),

            ),


            /*              Positioned(
              top: 0,
              left: 0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                child: Icon(
                  isRead ? Icons.offline_pin : Icons.offline_pin_outlined,
                  color: isRead ? AppStyles.primaryClr : Colors.white,
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
