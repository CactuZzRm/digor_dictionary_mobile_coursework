import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';

import '../../../navigator/navigate_effect.dart';
import '../../../outside_functions.dart';
import '../../about_app_page/about_app_page.dart';
import '../../dictionaries_page/dictionaries_page.dart';
import '../../gratitudes_page/gratitudes_page.dart';
import '../../settings_page/settings_page.dart';
import '../home_page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            color: const Color.fromARGB(255, 9, 65, 114),
            child: Image.asset(
              'assets/1.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          ListTile(
            dense: true,
            horizontalTitleGap: 10,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            leading: Icon(Icons.book_outlined, color: theme.textTheme.bodyMedium!.color),
            title: Text(tr('dictionaries'),
                style: theme.textTheme.bodyMedium!.copyWith(fontSize: 14, fontWeight: FontWeight.w500)),
            onTap: () {
              Navigator.of(context).push(NavigateEffects.fadeTransitionToPage(const DictionariesPage()));
            },
          ),
          const Divider(thickness: 1),
          ListTile(
            dense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            horizontalTitleGap: 10,
            title: Text(tr('gratitudes'),
                style: theme.textTheme.bodyMedium!.copyWith(fontSize: 14, fontWeight: FontWeight.w500)),
            leading: Icon(Icons.star_outline, color: theme.textTheme.bodyMedium!.color),
            onTap: () {
              Navigator.of(context).push(NavigateEffects.fadeTransitionToPage(const GratitudesPage()));
            },
          ),
          const Divider(thickness: 1),
          ListTile(
            dense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            horizontalTitleGap: 10,
            title: Text(tr('settings'),
                style: theme.textTheme.bodyMedium!.copyWith(fontSize: 14, fontWeight: FontWeight.w500)),
            leading: Icon(Icons.settings, color: theme.textTheme.bodyMedium!.color),
            onTap: () {
              Navigator.of(context).push(NavigateEffects.fadeTransitionToPage(const SettingsPage()));
            },
          ),
          ListTile(
            dense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            horizontalTitleGap: 10,
            title: Text(tr('about_app'),
                style: theme.textTheme.bodyMedium!.copyWith(fontSize: 14, fontWeight: FontWeight.w500)),
            leading: Icon(Icons.info_outline, color: theme.textTheme.bodyMedium!.color),
            onTap: () {
              Navigator.of(context).push(NavigateEffects.fadeTransitionToPage(const AboutAppPage()));
            },
          ),
          const Divider(thickness: 1),
          ListTile(
            dense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            horizontalTitleGap: 10,
            title: Text(tr('write_to_support'),
                style: theme.textTheme.bodyMedium!.copyWith(fontSize: 14, fontWeight: FontWeight.w500)),
            leading: Icon(Icons.mail_outlined, color: theme.textTheme.bodyMedium!.color),
            onTap: () {
              homePageKey.currentState?.closeDrawer();
              OutsideFunctions.sendMail(context);
            },
          ),
          ListTile(
            dense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            horizontalTitleGap: 10,
            title: Text(tr('rate_app'),
                style: theme.textTheme.bodyMedium!.copyWith(fontSize: 14, fontWeight: FontWeight.w500)),
            leading: Icon(Icons.star_half, color: theme.textTheme.bodyMedium!.color),
            onTap: () {
              homePageKey.currentState?.closeDrawer();
              LaunchReview.launch();
            },
          ),
          ListTile(
            dense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            horizontalTitleGap: 10,
            title: Text(tr('share'),
                style: theme.textTheme.bodyMedium!.copyWith(fontSize: 14, fontWeight: FontWeight.w500)),
            leading: Icon(Icons.share_outlined, color: theme.textTheme.bodyMedium!.color),
            onTap: () {
              homePageKey.currentState?.closeDrawer();
              OutsideFunctions.share(Platform.isIOS);
            },
          ),
        ],
      ),
    );
  }
}
