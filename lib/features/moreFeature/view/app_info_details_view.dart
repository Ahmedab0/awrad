import 'package:awrad/core/customWidgets/custom_failure_state.dart';
import 'package:awrad/core/customWidgets/custom_loading_indicator.dart';
import 'package:awrad/core/utils/api_services.dart';
import 'package:awrad/features/moreFeature/data/repos/settings_repo_impl.dart';
import 'package:awrad/features/moreFeature/logic/about_app_cubit/about_app_cubit.dart';
import 'package:awrad/features/moreFeature/view/more_settings_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/customWidgets/circle_arrow_back.dart';
import '../../../core/utils/app_styles.dart';

class AppInfoDetailsView extends StatelessWidget {
  static const String routeNamed = 'AppInfoDetailsView';

  const AppInfoDetailsView({super.key});

  final String loremTxt =
      'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام "هنا يوجد محتوى نصي، هنا يوجد محتوى نصي" فتجعلها تبدو (أي الأحرف) وكأنها نص مقروء. العديد من برامح النشر المكتبي وبرامح تحرير صفحات الويب تستخدم لوريم إيبسوم بشكل إفتراضي كنموذج عن النص';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (context) =>
            AboutAppCubit(SettingsRepoImpl(ApiServices(Dio())))..fetchAppInfo(),
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
                  //Text('تطبيق أوراد', style: AppStyles.bold10(context).copyWith(fontSize: 12, color: const Color(0xff242424))),
                  const SizedBox(height: 12),
                  BlocBuilder<AboutAppCubit, AboutAppState>(
                    builder: (context, state) {
                      if (state is AboutAppSuccessState) {
                        return Text(
                          state.aboutAppModel.data?.content ?? '',
                          style: AppStyles.regular11(context),
                          textAlign: TextAlign.justify,
                        );
                      } else if (state is AboutAppFailureState) {
                        return CustomFailureState(
                            errorText: state.errorMessage,
                            onPressed: () {
                              BlocProvider.of<AboutAppCubit>(context)
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
