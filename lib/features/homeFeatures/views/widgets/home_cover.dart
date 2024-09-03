import 'package:awrad/features/homeFeatures/logoc/home_slider_cubit/home_slider_cubit.dart';
import 'package:awrad/features/moreFeature/view/more_settings_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/customWidgets/custom_failure_state.dart';
import '../../../../core/customWidgets/custom_loading_indicator.dart';

class HomeCover extends StatelessWidget {
  const HomeCover({super.key});


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height * 0.25;
    return Stack(
      children: [
        // Home Cover
        BlocBuilder<HomeSliderCubit, HomeSliderState>(
          builder: (context, state) {
            if (state is HomeSliderSuccessState) {
              return AspectRatio(
                aspectRatio: 375 / 250,
                child: SizedBox(
                  height: height,
                  child: CachedNetworkImage(
                    imageUrl: state.sliders[0].image ?? "https://i0.wp.com/ourscene.org/wp-content/uploads/2022/01/placeholder-2.png?fit=1200%2C800&ssl=1",
                    fit: BoxFit.fill,
                    placeholder: (context, url) => Image.asset(
                      'assets/images/homeCover.png',
                      fit: BoxFit.fill,
                    ),
                    errorWidget: (context, url, error) => Center(
                        child: Image.asset(
                      'assets/images/noData.png',
                      fit: BoxFit.fill,
                    )), //Icon(Icons.error),
                  ),

              //            Image.asset('assets/images/homeCover.png'),
                ),
              );
            } else if (state is HomeSliderFailureState) {
              return CustomFailureState(
                errorText: state.errorMessage,
                onPressed: () async {
                  await BlocProvider.of<HomeSliderCubit>(context).fetchSlider();
                },
              );
            } else {
              return const CustomLoadingIndicator();
            }
          },
        ),
        // Settings
        Positioned(
          top: 45,
          left: 20,
          child: InkWell(
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(MoreSettings.routeNamed),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: const Color(0xff06353E),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Icon(
                Icons.settings_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ),
        // App Logo
    /*    Positioned(
          top: 65,
          right: 25,
          child: SizedBox(
            height: 105,
            child: Image.asset(
              'assets/images/splashLogo.png',
              fit: BoxFit.fill,
            ),
          ),
        ),*/
      ],
    );
  }
}
