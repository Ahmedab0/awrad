import 'package:awrad/features/moreFeature/view/app_info_details_view.dart';
import 'package:awrad/features/moreFeature/view/widgets/custom_more_list_tile.dart';
import 'package:flutter/material.dart';

class MoreSettingsBody extends StatelessWidget {
  const MoreSettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      //alignment: Alignment.topCenter,
      children: [
        // Background
        AspectRatio(
          aspectRatio: 115 / 175,
          child: Container(
            height: 175,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: ExactAssetImage('assets/images/morebg.png'),
              ),
            ),
          ),
        ),


          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                // logo
                Center(
                  child: SizedBox(
                    height: 175,
                    child: AspectRatio(
                      aspectRatio: 115 / 175,
                      child: Image.asset(
                        'assets/images/moreLogo.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                // app info
                GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed(AppInfoDetailsView.routeNamed),
                  child: const CustomMoreListTile(
                      title: 'عن التطبيق', icon: Icons.info_outline_rounded),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const CustomMoreListTile(
                      title: 'شارك التطبيق', icon: Icons.share_outlined),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const CustomMoreListTile(
                      title: 'قيم التطبيق', icon: Icons.star_border_outlined),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const CustomMoreListTile(
                      title: 'تواصل معانا', icon: Icons.call_rounded),
                ),
              ],
            ),
          ),

        Align(
          alignment: Alignment.bottomCenter,
          child: AspectRatio(
            aspectRatio: 350 / 191,
            child: Container(
              height: 191,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: ExactAssetImage('assets/images/moreVector.png'),
                ),
              ),
            ),
          ),
        ),

        //Image
      ],
    );
  }
}
