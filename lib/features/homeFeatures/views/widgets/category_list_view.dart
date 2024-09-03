import 'package:awrad/core/customWidgets/custom_failure_state.dart';
import 'package:awrad/core/customWidgets/custom_loading_indicator.dart';
import 'package:awrad/features/homeFeatures/logoc/home_categories_cubit/home_categories_cubit.dart';
import 'package:awrad/features/homeFeatures/views/widgets/categories_item.dart';
import 'package:awrad/features/homeFeatures/views/widgets/dhikr_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});


/*  final List<DhikrModel> dhikrs = const [
    DhikrModel(title: 'ورد الاستغفار',
        description: 'ليس كثيرا علي الله ان يغفر لك',
        imgUrl: 'assets/images/dhikrsImg/dhikr6.png'),
    DhikrModel(title: 'ورد الاستغفار',
        description: 'ليس كثيرا علي الله ان يغفر لك',
        imgUrl: 'assets/images/dhikrsImg/dhikr7.png'),
    DhikrModel(title: 'ورد الاستغفار',
        description: 'ليس كثيرا علي الله ان يغفر لك',
        imgUrl: 'assets/images/dhikrsImg/dhikr8.png'),
    DhikrModel(title: 'ورد الاستغفار',
        description: 'ليس كثيرا علي الله ان يغفر لك',
        imgUrl: 'assets/images/dhikrsImg/dhikr9.png'),
    DhikrModel(title: 'ورد الاستغفار',
        description: 'ليس كثيرا علي الله ان يغفر لك',
        imgUrl: 'assets/images/dhikrsImg/dhikr10.png'),
    DhikrModel(title: 'ورد الاستغفار',
        description: 'ليس كثيرا علي الله ان يغفر لك',
        imgUrl: 'assets/images/dhikrsImg/dhikr1.png'),
    DhikrModel(title: 'ورد الاستغفار',
        description: 'ليس كثيرا علي الله ان يغفر لك',
        imgUrl: 'assets/images/dhikrsImg/dhikr2.png'),
    DhikrModel(title: 'ورد الاستغفار',
        description: 'ليس كثيرا علي الله ان يغفر لك',
        imgUrl: 'assets/images/dhikrsImg/dhikr3.png'),
    DhikrModel(title: 'ورد الاستغفار',
        description: 'ليس كثيرا علي الله ان يغفر لك',
        imgUrl: 'assets/images/dhikrsImg/dhikr4.png'),
    DhikrModel(title: 'ورد الاستغفار',
        description: 'ليس كثيرا علي الله ان يغفر لك',
        imgUrl: 'assets/images/dhikrsImg/dhikr5.png'),
  ];*/

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCategoriesCubit, HomeCategoriesState>(
        builder: (context, state) {
          if (state is HomeCategoriesSuccessState) {
            return ListView.builder(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              itemCount: state.categories.length,
              itemBuilder: (context, index) =>
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushReplacementNamed(
                            context, DhikrDetailsView.routeNamed,
                            arguments: state.categories[index]),
                    child: SizedBox(
                        height: 87,
                        child: CategoryItem(categoryModel: state.categories[index],),
                        ),
                  ),
            );
          } else if (state is HomeCategoriesFailureState) {
            return CustomFailureState(errorText: state.errorMessage, onPressed: () async {
              await BlocProvider.of<HomeCategoriesCubit>(context).fetchHomeCategories();
            });
          } else {
            return const CustomLoadingIndicator();
          }
        });
  }
}
