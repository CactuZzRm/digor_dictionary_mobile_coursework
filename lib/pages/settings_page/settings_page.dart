import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../outside_functions.dart';
import '../home_page/home_page_model.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(tr('settings'))),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15),
            child: Text(tr('common'),
                style: theme.textTheme.bodyMedium!.copyWith(color: Colors.blue, fontWeight: FontWeight.w400)),
          ),
          Container(
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.3)))),
            child: ListTile(
              title: Text(tr('language'),
                  style: theme.textTheme.bodyMedium!.copyWith(fontSize: 16, fontWeight: FontWeight.w500)),
              onTap: () => OutsideFunctions.showChangeLanguageDialog(context),
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.3)))),
            child: ListTile(
                title: Text(tr('theme'),
                    style: theme.textTheme.bodyMedium!.copyWith(fontSize: 16, fontWeight: FontWeight.w500)),
                onTap: () => showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2.0))),
                        child: Consumer(builder: (context, ref, child) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20, top: 16, bottom: 8),
                                child: Text(
                                  tr('theme'),
                                  style:
                                      theme.textTheme.bodyMedium!.copyWith(fontSize: 20, fontWeight: FontWeight.w500),
                                ),
                              ),
                              ListTile(
                                visualDensity: const VisualDensity(vertical: -.3),
                                contentPadding: const EdgeInsets.only(left: 8),
                                onTap: () {
                                  if (theme.brightness == Brightness.dark) AdaptiveTheme.of(context).setLight();
                                  Navigator.of(context).pop();
                                },
                                leading: Radio(
                                  groupValue: theme.brightness,
                                  value: Brightness.light,
                                  onChanged: (value) {
                                    if (theme.brightness == Brightness.dark) AdaptiveTheme.of(context).setLight();
                                    Navigator.of(context).pop();
                                  },
                                ),
                                title: Text(
                                  tr('light_theme'),
                                  style:
                                      theme.textTheme.bodyMedium!.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                                ),
                              ),
                              ListTile(
                                visualDensity: const VisualDensity(vertical: -.3),
                                contentPadding: const EdgeInsets.only(left: 8),
                                onTap: () {
                                  if (theme.brightness == Brightness.light) AdaptiveTheme.of(context).setDark();
                                  Navigator.of(context).pop();
                                },
                                leading: Radio(
                                  groupValue: theme.brightness,
                                  value: Brightness.dark,
                                  onChanged: (value) {
                                    if (theme.brightness == Brightness.light) AdaptiveTheme.of(context).setDark();
                                    Navigator.of(context).pop();
                                  },
                                ),
                                title: Text(
                                  tr('dark_theme'),
                                  style:
                                      theme.textTheme.bodyMedium!.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
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
                    })),
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: 3),
            title: Text(tr('split_screen'),
                style: theme.textTheme.bodyMedium!.copyWith(fontSize: 16, fontWeight: FontWeight.w500)),
            onTap: () => ref.read(splitModeProvider.notifier).newState = !ref.read(splitModeProvider),
            subtitle: Text(
              tr('split_screen_subtitle'),
              style: theme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
            ),
            trailing: Checkbox(
              value: ref.watch(splitModeProvider),
              onChanged: (value) => ref.read(splitModeProvider.notifier).newState = value!,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15),
            child: Text(tr('glossary'),
                style: theme.textTheme.bodyMedium!.copyWith(color: Colors.blue, fontWeight: FontWeight.w400)),
          ),
          ListTile(
              visualDensity: const VisualDensity(vertical: -.3),
              title: Text(tr('font_size'),
                  style: theme.textTheme.bodyMedium!.copyWith(fontSize: 16, fontWeight: FontWeight.w500)),
              onTap: () => showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2.0))),
                      child: Consumer(builder: (context, ref, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 16, bottom: 8),
                              child: Text(tr('font_size'),
                                  style:
                                      theme.textTheme.bodyMedium!.copyWith(fontSize: 20, fontWeight: FontWeight.w500)),
                            ),
                            ListTile(
                              visualDensity: const VisualDensity(vertical: -.3),
                              contentPadding: const EdgeInsets.only(left: 8),
                              onTap: () {
                                ref.read(glossaryZoomProvider.notifier).newState = GlossaryZoomState.little;
                                Navigator.of(context).pop();
                              },
                              leading: Radio(
                                groupValue: ref.watch(glossaryZoomProvider),
                                value: .9,
                                onChanged: (value) {
                                  ref.read(glossaryZoomProvider.notifier).newState = GlossaryZoomState.little;
                                  Navigator.of(context).pop();
                                },
                              ),
                              title: Text(
                                tr('little'),
                                style: theme.textTheme.bodyMedium!.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                            ListTile(
                              visualDensity: const VisualDensity(vertical: -.3),
                              contentPadding: const EdgeInsets.only(left: 8),
                              onTap: () {
                                ref.read(glossaryZoomProvider.notifier).newState = GlossaryZoomState.normal;
                                Navigator.of(context).pop();
                              },
                              leading: Radio(
                                groupValue: ref.watch(glossaryZoomProvider),
                                value: 1,
                                onChanged: (value) {
                                  ref.read(glossaryZoomProvider.notifier).newState = GlossaryZoomState.normal;
                                  Navigator.of(context).pop();
                                },
                              ),
                              title: Text(
                                tr('normal'),
                                style: theme.textTheme.bodyMedium!.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                            ListTile(
                              visualDensity: const VisualDensity(vertical: -.3),
                              contentPadding: const EdgeInsets.only(left: 8),
                              onTap: () {
                                ref.read(glossaryZoomProvider.notifier).newState = GlossaryZoomState.big;
                                Navigator.of(context).pop();
                              },
                              leading: Radio(
                                groupValue: ref.watch(glossaryZoomProvider),
                                value: 1.1,
                                onChanged: (value) {
                                  ref.read(glossaryZoomProvider.notifier).newState = GlossaryZoomState.big;
                                  Navigator.of(context).pop();
                                },
                              ),
                              title: Text(
                                tr('big'),
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
                  })),
        ],
      ),
    );
  }
}
