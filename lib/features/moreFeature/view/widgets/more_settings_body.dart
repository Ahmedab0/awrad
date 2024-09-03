
import 'package:awrad/features/moreFeature/view/app_info_details_view.dart';
import 'package:awrad/features/moreFeature/view/widgets/custom_more_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreSettingsBody extends StatelessWidget {
  const MoreSettingsBody({super.key});

  @override
  Widget build(BuildContext context) {

    /*
    void _launchURL(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
    */

    return Stack(
      //alignment: Alignment.topCenter,
      children: [
        // Background
        AspectRatio(
          aspectRatio: 115 / 175,
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.22,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: ExactAssetImage('assets/images/morebg.png'),
              ),
            ),
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
              // Share app
              GestureDetector(
                onTap:
                    () async {
                    //String andrUrl = '';
                    //String iOsUrl = '';
                    final result = await Share.share('com.example.awrad');

                    if (result.status == ShareResultStatus.success) {
                      print('Thank you for sharing my website!');
                    }
                  }
                ,
                child: const CustomMoreListTile(
                    title: 'شارك التطبيق', icon: Icons.share_outlined),
              ),
              // App Rating
              GestureDetector(
                onTap: () {},
                child: const CustomMoreListTile(
                    title: 'قيم التطبيق', icon: Icons.star_border_outlined),
              ),
              // contact us
              GestureDetector(
                onTap: (){},//(){_launchURL('tel:+1234567890');},
                child: const CustomMoreListTile(
                    title: 'تواصل معانا', icon: Icons.call_rounded),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
