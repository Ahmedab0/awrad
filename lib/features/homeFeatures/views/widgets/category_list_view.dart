import 'package:awrad/features/homeFeatures/logic/home_categories_cubit/home_categories_cubit.dart';
import 'package:awrad/features/homeFeatures/views/widgets/categories_item.dart';
import 'package:awrad/features/homeFeatures/views/category_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/custom_widgets/custom_failure_state.dart';
import '../../../../core/custom_widgets/custom_loading_indicator.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCategoriesCubit, HomeCategoriesState>(
        builder: (context, state) {
      if (state is HomeCategoriesSuccessState) {
        return ListView.builder(
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          itemCount: state.categories.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, CategoryDetailsView.routeNamed,
                  arguments: state.categories[index]);
            },
            child: SizedBox(
              height: 87,
              child: CategoryItem(
                categoryModel: state.categories[index],
              ),
            ),
          ),
        );
      } else if (state is HomeCategoriesFailureState) {
        return CustomFailureState(
            //errorText: state.errorMessage,
            onPressed: () async {
              await BlocProvider.of<HomeCategoriesCubit>(context)
                  .fetchHomeCategories();
            });
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
