import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ru', 'RU'), Locale('tr', 'TR'), Locale('de', 'DE')],
      path: 'lang',
      fallbackLocale: const Locale('ru', 'RU'),
      child: MyApp(
        savedThemeMode,
      ),
    ),
  );
}
