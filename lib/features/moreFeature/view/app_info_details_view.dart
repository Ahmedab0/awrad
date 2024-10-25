import 'package:awrad/core/utils/service_locator.dart';
import 'package:awrad/features/moreFeature/view/more_settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/custom_widgets/circle_arrow_back.dart';
import '../../../core/custom_widgets/custom_failure_state.dart';
import '../../../core/custom_widgets/custom_loading_indicator.dart';
import '../../../core/utils/app_styles.dart';
import '../data/repos/app_info_repo_impl.dart';
import '../logic/app_info_cubit/app_info_cubit.dart';

class AppInfoDetailsView extends StatelessWidget {
  static const String routeNamed = 'AppInfoDetailsView';

  const AppInfoDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (context) =>
            AppInfoCubit(getIt.get<AppInfoRepoImpl>())..fetchAppInfo(),
        child: Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: InkWell(
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed(MoreSettings.routeNamed),
                  child: const CircleArrowBack(
                    clr: Colors.white,
                    iconSize: 16,
                  ),
                ),
              ),
            ],
            centerTitle: true,
            title: Text(
              'عن التطبيق',
              style: AppStyles.bold14(context).copyWith(color: Colors.white),
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image Cover
                  AspectRatio(
                    aspectRatio: 357 / 200,
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.25,
                      child: Image.asset('assets/images/appInfoCover.png'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const SizedBox(height: 12),
                  BlocBuilder<AppInfoCubit, AppInfoState>(
                    builder: (context, state) {
                      if (state is AppInfoSuccessState) {
                        Map<String, dynamic> exData = state.info;
                        return Text(
                          exData["data"]['content'] ?? '',
                          style: AppStyles.regular11(context),
                          textAlign: TextAlign.justify,
                        );
                      } else if (state is AppInfoFailureState) {
                        return CustomFailureState(
                            //errorText: state.errorMessage,
                            onPressed: () {
                              BlocProvider.of<AppInfoCubit>(context)
                                  .fetchAppInfo();
                            });
                      } else {
                        return const CustomLoadingIndicator();
                      }
                    },
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
