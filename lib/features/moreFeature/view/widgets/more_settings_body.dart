import 'dart:developer';
import 'dart:io';

import 'package:awrad/features/moreFeature/view/app_info_details_view.dart';
import 'package:awrad/features/moreFeature/view/widgets/custom_more_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreSettingsBody extends StatelessWidget {
  const MoreSettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    // launch Url Method
    Future<void> _launchUrl(BuildContext context, String url) async {
      try {
        await canLaunchUrl(Uri.parse(url))
            ? await launchUrl(Uri.parse(url))
            : throw 'Could not launch $url';
        log('_launchUrl is called');
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(e.toString())));
        }
      }
    }

    Future<void> makeCall(BuildContext context, String phoneNum) async {
      final Uri phoneUri = Uri(scheme: 'tel', path: phoneNum);
      try {
        await canLaunchUrl(phoneUri)
            ? await launchUrl(phoneUri)
            : throw 'Could not make a call to this num: $phoneUri';
        log('makeCall is called');

      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(e.toString())));
        }
      }
    }

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
                onTap: () async {
                  String andrUrl = 'https://www.google.com'; //'com.example.awrad';
                  String iOsUrl = 'App Link';
                  final result =
                      await Share.share(Platform.isAndroid ? andrUrl : iOsUrl);

                  if (result.status == ShareResultStatus.success) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Thank you for sharing')));
                    }
                  }
                },
                child: const CustomMoreListTile(
                    title: 'شارك التطبيق', icon: Icons.share_outlined),
              ),
              // App Rating
              GestureDetector(
                onTap: () {
                  String url = Platform.isAndroid ? 'AndroidUrl' : 'IosUrl';
                  _launchUrl(context, url);
                },
                child: const CustomMoreListTile(
                    title: 'قيم التطبيق', icon: Icons.star_border_outlined),
              ),
              // contact us
              GestureDetector(
                onTap: ()=> makeCall(context, '+1234567890'), //(){_launchURL('tel:+1234567890');},
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
