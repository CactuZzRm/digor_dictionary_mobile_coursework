import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'shared_pref.dart';

part 'localization.g.dart';

enum LocalizationLanguage { system, russian, english, turkish, digor }

@Riverpod(keepAlive: true)
class LocalizationMode extends _$LocalizationMode {
  late final SharedPreferences sharedPreferences;

  @override
  LocalizationLanguage build() {
    init();
    return LocalizationLanguage.system;
  }

  Future<void> init() async {
    sharedPreferences = await ref.read(fetchSharedPreferencesProvider.future);
    final String locale = sharedPreferences.getString('localLang') ?? 'system';
    switch (locale) {
      case 'system':
        state = LocalizationLanguage.system;
        break;
      case 'en_US':
        state = LocalizationLanguage.english;
        break;
      case 'ru_RU':
        state = LocalizationLanguage.russian;
        break;
      case 'tr_TR':
        state = LocalizationLanguage.turkish;
        break;
      case 'de_DE':
        state = LocalizationLanguage.digor;
        break;
    }
  }

  void onChangeLocale(LocalizationLanguage locale) {
    switch (locale) {
      case LocalizationLanguage.system:
        sharedPreferences.setString('localLang', 'system');
        break;
      case LocalizationLanguage.english:
        sharedPreferences.setString('localLang', 'en_US');
        break;
      case LocalizationLanguage.russian:
        sharedPreferences.setString('localLang', 'ru_RU');
        break;
      case LocalizationLanguage.turkish:
        sharedPreferences.setString('localLang', 'tr_TR');
        break;
      case LocalizationLanguage.digor:
        sharedPreferences.setString('localLang', 'de_DE');
        break;
    }
    state = locale;
  }
}
