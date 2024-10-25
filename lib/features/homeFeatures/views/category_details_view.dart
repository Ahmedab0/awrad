import 'package:awrad/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/custom_widgets/circle_arrow_back.dart';
import '../../../core/utils/app_styles.dart';
import '../../bottomNavBarFeatures/views/custom_bottom_navigation_bar.dart';
import '../data/models/category_model.dart';
import '../data/repos/home_repo_impl.dart';
import '../logic/category_details_cubit/category_details_cubit.dart';
import 'widgets/category_details_list_view.dart';

class CategoryDetailsView extends StatelessWidget {
  static const routeNamed = 'CategoryDetailsView';

  const CategoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryModel categoryModel =
        ModalRoute.of(context)!.settings.arguments as CategoryModel;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (context) => CategoryDetailsCubit(getIt.get<HomeRepoImpl>())..fetchCategoryDetails(catId: categoryModel.id!),
        child: Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: InkWell(
                  onTap: () => Navigator.of(context).pushReplacementNamed(
                      CustomBottomNavigationBar.routeNamed),
                  child: const CircleArrowBack(
                    clr: Colors.white,
                    iconSize: 16,
                  ),
                ),
              ),
            ],
            /*leading: IconButton(
              onPressed: () async {
                await ApiServices(Dio()).post(endPoint: 'toggleFav', id: categoryModel.id!);
              },
              icon: Icon(Icons.favorite, color: AppStyles.darkRedClr),
              //isFav? Icon(Icons.favorite, color: AppStyles.darkRedClr) : const Icon(Icons.favorite_border),
            ),*/
            centerTitle: true,
            title: Text(
              categoryModel.name!,
              style: AppStyles.bold14(context).copyWith(color: Colors.white),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: CategoryDetailsListView(
              clr: const Color(0xffF22323), categoryModel: categoryModel,
            ),
          ),
        ),
      ),
    );
  }
}
