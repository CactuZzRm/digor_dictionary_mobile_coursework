import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:url_launcher/url_launcher.dart';

import 'providers/api_provider.dart';
import 'providers/localization.dart';
import 'providers/search.dart';

class OutsideFunctions {
  static Future<void> sendMail(BuildContext context) async {
    final uri = Uri.parse('mailto:digor.dict@gmail.com?subject=DigorApp');
    try {
      await launchUrl(uri);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          backgroundColor: const Color.fromARGB(255, 45, 32, 65).withOpacity(.9),
          content: Text('${tr('could_not_open_the_mail')}...'),
        ),
      );
    }
  }

  static Future<void> showCopiedSnackBar(BuildContext context, String text) async {
    final theme = Theme.of(context);
    ScaffoldMessenger.of(context).clearSnackBars();
    await Clipboard.setData(ClipboardData(text: text)).whenComplete(
      () => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.black.withOpacity(.7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          behavior: SnackBarBehavior.floating,
          content: Text(
            '"$text" - ${tr('copied')}',
            style: theme.textTheme.bodySmall!.copyWith(color: Colors.white, fontSize: 15),
          ),
        ),
      ),
    );
  }

  static Future<void> showZoomSnackBar(BuildContext context, double zoom) async {
    final theme = Theme.of(context);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 150,
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.black.withOpacity(.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        behavior: SnackBarBehavior.floating,
        content: Center(
          child: Text('${tr('zoom')} ${(zoom * 100).toStringAsFixed(0)}%',
              style: theme.textTheme.bodySmall!.copyWith(color: Colors.white, fontSize: 15)),
        ),
      ),
    );
  }

  static Future<void> showRefSnackBar(BuildContext context, String word) async {
    final theme = Theme.of(context);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.black.withOpacity(.7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        behavior: SnackBarBehavior.floating,
        content: Text('${tr('word')} $word ${tr('not_found')}',
            style: theme.textTheme.bodySmall!.copyWith(color: Colors.white)),
      ),
    );
  }

  static Future<void> share(bool isIOS) async {
    await FlutterShare.share(
      title: 'Digor',
      linkUrl: !isIOS
          ? 'https://play.google.com/store/apps/details?id=com.budajti.digor'
          : 'https://apps.apple.com/us/app/digor-%D0%BE%D0%BD%D0%BB%D0%B0%D0%B9%D0%BD-%D1%81%D0%BB%D0%BE%D0%B2%D0%B0%D1%80%D1%8C/id6449050450',
    );
  }

  static void showWriteToDeveloperDialog(BuildContext context, String title, WidgetRef ref) {
    final theme = Theme.of(context);
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyMedium!
                      .copyWith(fontSize: 20, fontWeight: FontWeight.w500, fontFamily: 'SamsungOne'),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                    color: theme.canvasColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  height: 200,
                  child: TextField(
                    style: theme.textTheme.bodyMedium!.copyWith(fontSize: 14, decoration: TextDecoration.none),
                    controller: controller,
                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: tr('message_text'),
                        hintStyle: theme.textTheme.bodyMedium!.copyWith(
                            fontSize: 14,
                            color: theme.textTheme.bodySmall!.color!.withOpacity(0.3),
                            fontFamily: 'SamsungOne')),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: Navigator.of(context).pop,
                        child: Text(tr(
                          'cancel',
                        ).toUpperCase()),
                      ),
                      TextButton(
                        child: Text(tr('send').toUpperCase()),
                        onPressed: () {
                          Navigator.of(context).pop();
                          if (controller.text.trim().isNotEmpty) {
                            ref.read(apiClientProvider).addReport(
                              {
                                'text': controller.text.trim(),
                                'date': DateFormat('yyyy-MM-ddTHH:mm:ss').format(DateTime.now())
                              },
                            );
                            // FirebaseFirestore.instance.collection('reports').add(
                            //   {
                            //     'report': controller.text.trim(),
                            //     'report_date': DateFormat('yyyy-MM-ddTHH:mm:ss').format(DateTime.now())
                            //   },
                            // );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void showChangeLanguageDialog(BuildContext context) {
    final theme = Theme.of(context);
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2.0))),
            child: Consumer(builder: (context, ref, child) {
              final currentLocalizationMode = ref.watch(localizationModeProvider);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 16),
                    child: Text(tr('language'),
                        style: theme.textTheme.bodyMedium!.copyWith(fontSize: 20, fontWeight: FontWeight.w500)),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 8),
                    onTap: () {
                      ref.read(localizationModeProvider.notifier).onChangeLocale(LocalizationLanguage.system);
                      context.resetLocale().whenComplete(() => Navigator.of(context).pop());
                    },
                    leading: Radio(
                      groupValue: currentLocalizationMode,
                      value: LocalizationLanguage.system,
                      onChanged: (value) {
                        ref.read(localizationModeProvider.notifier).onChangeLocale(value!);
                        context.resetLocale().whenComplete(() => Navigator.of(context).pop());
                      },
                    ),
                    title: Text(
                      tr('system'),
                      style: theme.textTheme.bodyMedium!.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 8),
                    onTap: () {
                      ref.read(localizationModeProvider.notifier).onChangeLocale(LocalizationLanguage.digor);
                      context.setLocale(const Locale('de', 'DE')).whenComplete(() => Navigator.of(context).pop());
                    },
                    leading: Radio(
                      groupValue: currentLocalizationMode,
                      value: LocalizationLanguage.digor,
                      onChanged: (value) {
                        ref.read(localizationModeProvider.notifier).onChangeLocale(value!);
                        context.setLocale(const Locale('de', 'DE')).whenComplete(() => Navigator.of(context).pop());
                      },
                    ),
                    title: Text(
                      tr('digor'),
                      style: theme.textTheme.bodyMedium!.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 8),
                    onTap: () {
                      final searchMode = ref.read(searchModeProvider).value;
                      if ([LanguageMode.digEnglish, LanguageMode.digRussian, LanguageMode.digTurkish]
                          .contains(searchMode)) {
                        ref.read(searchModeProvider.notifier).onDropDownSecondChange(tr('russian'));
                      } else {
                        ref.read(searchModeProvider.notifier).onDropDownFirstChange(tr('russian'));
                      }
                      ref.read(localizationModeProvider.notifier).onChangeLocale(LocalizationLanguage.russian);
                      context.setLocale(const Locale('ru', 'RU')).whenComplete(() => Navigator.of(context).pop());
                    },
                    leading: Radio(
                      groupValue: currentLocalizationMode,
                      value: LocalizationLanguage.russian,
                      onChanged: (value) {
                        final searchMode = ref.read(searchModeProvider).value;
                        if ([LanguageMode.digEnglish, LanguageMode.digRussian, LanguageMode.digTurkish]
                            .contains(searchMode)) {
                          ref.read(searchModeProvider.notifier).onDropDownSecondChange(tr('russian'));
                        } else {
                          ref.read(searchModeProvider.notifier).onDropDownFirstChange(tr('russian'));
                        }
                        ref.read(localizationModeProvider.notifier).onChangeLocale(value!);
                        context.setLocale(const Locale('ru', 'RU')).whenComplete(() => Navigator.of(context).pop());
                      },
                    ),
                    title: Text(
                      tr('russian'),
                      style: theme.textTheme.bodyMedium!.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 8),
                    onTap: () {
                      final searchMode = ref.read(searchModeProvider).value;
                      if ([LanguageMode.digEnglish, LanguageMode.digRussian, LanguageMode.digTurkish]
                          .contains(searchMode)) {
                        ref.read(searchModeProvider.notifier).onDropDownSecondChange(tr('english'));
                      } else {
                        ref.read(searchModeProvider.notifier).onDropDownFirstChange(tr('english'));
                      }
                      ref.read(localizationModeProvider.notifier).onChangeLocale(LocalizationLanguage.english);
                      context.setLocale(const Locale('en', 'US')).whenComplete(() => Navigator.of(context).pop());
                    },
                    leading: Radio(
                      groupValue: currentLocalizationMode,
                      value: LocalizationLanguage.english,
                      onChanged: (value) {
                        final searchMode = ref.read(searchModeProvider).value;
                        if ([LanguageMode.digEnglish, LanguageMode.digRussian, LanguageMode.digTurkish]
                            .contains(searchMode)) {
                          ref.read(searchModeProvider.notifier).onDropDownSecondChange(tr('english'));
                        } else {
                          ref.read(searchModeProvider.notifier).onDropDownFirstChange(tr('english'));
                        }
                        ref.read(localizationModeProvider.notifier).onChangeLocale(value!);
                        context.setLocale(const Locale('en', 'US')).whenComplete(() => Navigator.of(context).pop());
                      },
                    ),
                    title: Text(
                      tr('english'),
                      style: theme.textTheme.bodyMedium!.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 8),
                    onTap: () {
                      final searchMode = ref.read(searchModeProvider).value;
                      if ([LanguageMode.digEnglish, LanguageMode.digRussian, LanguageMode.digTurkish]
                          .contains(searchMode)) {
                        ref.read(searchModeProvider.notifier).onDropDownSecondChange(tr('english'));
                      } else {
                        ref.read(searchModeProvider.notifier).onDropDownFirstChange(tr('english'));
                      }
                      ref.read(localizationModeProvider.notifier).onChangeLocale(LocalizationLanguage.turkish);
                      context.setLocale(const Locale('tr', 'TR')).whenComplete(() => Navigator.of(context).pop());
                    },
                    leading: Radio(
                      groupValue: currentLocalizationMode,
                      value: LocalizationLanguage.turkish,
                      onChanged: (value) {
                        final searchMode = ref.read(searchModeProvider).value;
                        if ([LanguageMode.digEnglish, LanguageMode.digRussian, LanguageMode.digTurkish]
                            .contains(searchMode)) {
                          ref.read(searchModeProvider.notifier).onDropDownSecondChange(tr('english'));
                        } else {
                          ref.read(searchModeProvider.notifier).onDropDownFirstChange(tr('english'));
                        }
                        ref.read(localizationModeProvider.notifier).onChangeLocale(value!);
                        context.setLocale(const Locale('tr', 'TR')).whenComplete(() => Navigator.of(context).pop());
                      },
                    ),
                    title: Text(
                      tr('turkish'),
                      style: theme.textTheme.bodyMedium!.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
                            child: Text(tr('cancel').toUpperCase(),
                                style: theme.textTheme.bodyMedium!.copyWith(color: Colors.blue)))
                      ],
                    ),
                  )
                ],
              );
            }),
          );
        });
  }

  static Future<void> showClearHistoryDialog(BuildContext context, Function callback, String content) async {
    final theme = Theme.of(context);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(2),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 22),
            padding: const EdgeInsets.all(17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: double.infinity),
                Text(content, style: theme.textTheme.bodyMedium!.copyWith(fontSize: 16)),
                const SizedBox(height: 20),
                SizedBox(
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: Navigator.of(context).pop,
                        child: Text(tr('no').toUpperCase()),
                      ),
                      TextButton(
                        child: Text(tr('yes').toUpperCase()),
                        onPressed: () {
                          callback();
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
