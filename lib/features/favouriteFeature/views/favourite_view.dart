import 'package:awrad/core/customWidgets/custom_failure_state.dart';
import 'package:awrad/core/customWidgets/custom_loading_indicator.dart';
import 'package:awrad/features/favouriteFeature/logic/fav_categories/fav_categories_cubit.dart';
import 'package:awrad/features/favouriteFeature/views/widgets/fav_category_item.dart';
import 'package:awrad/features/homeFeatures/views/widgets/dhikr_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteView extends StatefulWidget {
  static const String routeNamed = 'FavouriteView';

  const FavouriteView({super.key});

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  // test view
/*  final List<DhikrModel> dhikrs = const [
    DhikrModel(title: 'ورد الاستغفار', description: 'ليس كثيرا علي الله ان يغفر لك', imgUrl: 'assets/images/dhikrsImg/dhikr6.png'),
    DhikrModel(title: 'ورد الاستغفار', description: 'ليس كثيرا علي الله ان يغفر لك', imgUrl: 'assets/images/dhikrsImg/dhikr7.png'),
    DhikrModel(title: 'ورد الاستغفار', description: 'ليس كثيرا علي الله ان يغفر لك', imgUrl: 'assets/images/dhikrsImg/dhikr8.png'),
    DhikrModel(title: 'ورد الاستغفار', description: 'ليس كثيرا علي الله ان يغفر لك', imgUrl: 'assets/images/dhikrsImg/dhikr9.png'),
    DhikrModel(title: 'ورد الاستغفار', description: 'ليس كثيرا علي الله ان يغفر لك', imgUrl: 'assets/images/dhikrsImg/dhikr10.png'),
    DhikrModel(title: 'ورد الاستغفار', description: 'ليس كثيرا علي الله ان يغفر لك', imgUrl: 'assets/images/dhikrsImg/dhikr1.png'),
    DhikrModel(title: 'ورد الاستغفار', description: 'ليس كثيرا علي الله ان يغفر لك', imgUrl: 'assets/images/dhikrsImg/dhikr2.png'),
    DhikrModel(title: 'ورد الاستغفار', description: 'ليس كثيرا علي الله ان يغفر لك', imgUrl: 'assets/images/dhikrsImg/dhikr3.png'),
    DhikrModel(title: 'ورد الاستغفار', description: 'ليس كثيرا علي الله ان يغفر لك', imgUrl: 'assets/images/dhikrsImg/dhikr4.png'),
    DhikrModel(title: 'ورد الاستغفار', description: 'ليس كثيرا علي الله ان يغفر لك', imgUrl: 'assets/images/dhikrsImg/dhikr5.png'),
  ];*/

  @override
  void initState() {
    BlocProvider.of<FavCategoriesCubit>(context).fetchFavCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: BlocBuilder<FavCategoriesCubit, FavCategoriesState>(
        builder: (context, state) {
          if (state is FavCategoriesSuccessState) {
            return ListView.builder(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              itemCount: state.favList.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => Navigator.pushReplacementNamed(
                    context, DhikrDetailsView.routeNamed,
                    arguments: state.favList[index]),
                child: SizedBox(
                  height: 87,
                  child: FavCategoryItem(
                    favCategoryModel: state.favList[index],
                  ),
                ),
              ),
            );
          } else if (state is FavCategoriesFailureState) {
            return CustomFailureState(
              errorText: state.errorMessage,
              onPressed: () => BlocProvider.of<FavCategoriesCubit>(context)
                  .fetchFavCategories(),
            );
          } else {
            return const CustomLoadingIndicator();
          }
        },
      ),
    );
  }
}
