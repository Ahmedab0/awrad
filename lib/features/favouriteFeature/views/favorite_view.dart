import 'package:awrad/core/utils/app_styles.dart';
import 'package:awrad/features/favouriteFeature/data/repo/fav_repo_impl.dart';
import 'package:awrad/features/favouriteFeature/logic/fav_azkars_cubit/fav_azkars_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/custom_widgets/custom_failure_state.dart';
import '../../../core/custom_widgets/custom_initial_widget.dart';
import '../../../core/custom_widgets/custom_loading_indicator.dart';
import '../../../core/utils/service_locator.dart';
import '../../homeFeatures/data/models/category_azkar_model.dart';
import '../../homeFeatures/data/repos/home_repo_impl.dart';
import '../../homeFeatures/logic/toggle_fav_cubit/toggle_fav_cubit.dart';

class FavoriteView extends StatefulWidget {
  static const String routeNamed = 'FavoriteView';

  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  void initState() {
    BlocProvider.of<FavAzkarsCubit>(context).fetchFavAzkars();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: BlocBuilder<FavAzkarsCubit, FavAzkarsState>(
        builder: (context, state) {
          if (state is FavAzkarsSuccess) {
            return state.favAzkars.isEmpty
                ? const CustomInitialWidget()
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.favAzkars.length,
                    itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.only(
                            bottom: index == state.favAzkars.length - 1
                                ? 100.0
                                : 0.0),
                        child: FavItem(
                          categoryAzkarModel: state.favAzkars[index],
                          index: index,
                        )),
                  );
          } else if (state is FavAzkarsFailure) {
            return CustomFailureState(
              //errorText: state.errorMessage,
              onPressed: () =>
                  BlocProvider.of<FavAzkarsCubit>(context).fetchFavAzkars(),
            );
          } else {
            return const CustomLoadingIndicator();
          }
        },
      ),
    );
  }
}

class FavItem extends StatefulWidget {
  final CategoryAzkarModel categoryAzkarModel;
  final int index;

  const FavItem(
      {super.key, required this.categoryAzkarModel, required this.index});

  @override
  State<FavItem> createState() => _FavItemState();
}

class _FavItemState extends State<FavItem> {
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
                      .copyWith(color: AppStyles.primaryClr),
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
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) =>
                        ToggleFavCubit(getIt.get<HomeRepoImpl>()),
                  ),
                  BlocProvider(
                    create: (context) =>
                        FavAzkarsCubit(getIt.get<FavRepoImpl>()),
                  ),
                ],
                child: Builder(builder: (context) {
                  return IconButton(
                    onPressed: () {
                      BlocProvider.of<ToggleFavCubit>(context)
                          .toggleFavorite(widget.categoryAzkarModel.id!);
                      setState(() {
                        widget.categoryAzkarModel.isFav =
                            !widget.categoryAzkarModel.isFav!;
                      });
                      BlocProvider.of<FavAzkarsCubit>(context).fetchFavAzkars();
                    },
                    icon: Icon(
                        widget.categoryAzkarModel.isFav!
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: widget.categoryAzkarModel.isFav!
                            ? AppStyles.darkRedClr
                            : AppStyles.primaryClr),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
