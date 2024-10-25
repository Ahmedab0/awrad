import 'package:awrad/core/custom_widgets/custom_initial_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/custom_widgets/custom_failure_state.dart';
import '../../../../core/custom_widgets/custom_loading_indicator.dart';
import '../../data/models/category_model.dart';
import '../../logic/category_details_cubit/category_details_cubit.dart';
import 'category_details_item.dart';

class CategoryDetailsListView extends StatelessWidget {
  final Color clr;
  final CategoryModel categoryModel;

  const CategoryDetailsListView({super.key, required this.clr, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailsCubit, CategoryDetailsState>(
      builder: (context, state) {
        if (state is CategoryDetailsSuccess) {
          return state.items.isEmpty
              ? const CustomInitialWidget()
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.items.length,
                  itemBuilder: (context, index) => CategoryDetailsItem(
                    categoryAzkarModel: state.items[index],
                    index: index,
                    clr: clr,
                  ),
                );
        } else if (state is CategoryDetailsFailure) {
          return CustomFailureState(
              //errorText: state.errorMsg,
              onPressed: () {
                BlocProvider.of<CategoryDetailsCubit>(context).fetchCategoryDetails(catId: categoryModel.id!);
              });
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
