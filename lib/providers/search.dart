import 'package:easy_localization/easy_localization.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/word_model.dart';
import '../pages/home_page/home_page_model.dart';
import 'api_provider.dart';
import 'history.dart';
import 'shared_pref.dart';

part 'search.g.dart';

enum LanguageMode { digRussian, digEnglish, digTurkish, engDigor, rusDigor, turkDigor }

@Riverpod(keepAlive: true)
class SearchMode extends _$SearchMode {
  late SharedPreferences sharedPreferences;

  @override
  FutureOr<LanguageMode> build() async {
    final langMode = await init();
    return langMode;
  }

  Future<LanguageMode> init() async {
    sharedPreferences = await ref.read(fetchSharedPreferencesProvider.future);
    final String langMode = sharedPreferences.getString('langMode') ?? 'digRussian';
    switch (langMode) {
      case 'digRussian':
        return LanguageMode.digRussian;
      case 'digEnglish':
        return LanguageMode.digEnglish;
      case 'digTurkish':
        return LanguageMode.digTurkish;
      case 'engDigor':
        return LanguageMode.engDigor;
      case 'rusDigor':
        return LanguageMode.rusDigor;
      case 'turkDigor':
        return LanguageMode.turkDigor;
    }
    return LanguageMode.digRussian;
  }

  void onDropDownFirstChange(String value) {
    if (value == tr('russian')) {
      state = const AsyncValue.data(LanguageMode.rusDigor);
      sharedPreferences.setString('langMode', 'rusDigor');
    } else if (value == tr('english')) {
      state = const AsyncValue.data(LanguageMode.engDigor);
      sharedPreferences.setString('langMode', 'engDigor');
    } else if (value == tr('turkish')) {
      state = const AsyncValue.data(LanguageMode.turkDigor);
      sharedPreferences.setString('langMode', 'turkDigor');
    }
    ref.read(historyProvider.notifier).langModeUpdate();
  }

  void onDropDownSecondChange(String value) {
    if (value == tr('russian')) {
      state = const AsyncValue.data(LanguageMode.digRussian);
      sharedPreferences.setString('langMode', 'digRussian');
    } else if (value == tr('english')) {
      state = const AsyncValue.data(LanguageMode.digEnglish);
      sharedPreferences.setString('langMode', 'digEnglish');
    } else if (value == tr('turkish')) {
      state = const AsyncValue.data(LanguageMode.digTurkish);
      sharedPreferences.setString('langMode', 'digTurkish');
    }
    ref.read(historyProvider.notifier).langModeUpdate();
  }

  void onSwitchLanguageTap() {
    switch (state.value!) {
      case LanguageMode.digEnglish:
        state = const AsyncValue.data(LanguageMode.engDigor);
        sharedPreferences.setString('langMode', 'engDigor');
        break;
      case LanguageMode.digRussian:
        state = const AsyncValue.data(LanguageMode.rusDigor);
        sharedPreferences.setString('langMode', 'rusDigor');
        break;
      case LanguageMode.digTurkish:
        state = const AsyncValue.data(LanguageMode.turkDigor);
        sharedPreferences.setString('langMode', 'turkDigor');
        break;
      case LanguageMode.engDigor:
        state = const AsyncValue.data(LanguageMode.digEnglish);
        sharedPreferences.setString('langMode', 'digEnglish');
        break;
      case LanguageMode.rusDigor:
        state = const AsyncValue.data(LanguageMode.digRussian);
        sharedPreferences.setString('langMode', 'digRussian');
        break;
      case LanguageMode.turkDigor:
        state = const AsyncValue.data(LanguageMode.digTurkish);
        sharedPreferences.setString('langMode', 'digTurkish');
        break;
    }
    ref.read(historyProvider.notifier).langModeUpdate();
  }

  String getLanguageMode() {
    switch (state.value) {
      case LanguageMode.digEnglish:
        return 'en';
      case LanguageMode.engDigor:
        return 'en';
      case LanguageMode.digRussian:
        return 'ru';
      case LanguageMode.rusDigor:
        return 'ru';
      case LanguageMode.digTurkish:
        return 'turk';
      case LanguageMode.turkDigor:
        return 'turk';
      default:
        return 'ru';
    }
  }


  String getFullLanguageMode() {
    switch (state.value) {
      case LanguageMode.digEnglish:
        return 'Dig-En';
      case LanguageMode.engDigor:
        return 'En-Dig';
      case LanguageMode.digRussian:
        return 'Dig-Ru';
      case LanguageMode.rusDigor:
        return 'Ru-Dig';
      case LanguageMode.digTurkish:
        return 'Dig-Turk';
      case LanguageMode.turkDigor:
        return 'Turk-Dig';
      default:
        return 'Dig-Ru';
        }
       }

  String getFromLanguageMode() {
    switch (state.value) {
      case LanguageMode.digEnglish:
        return 'dig';
      case LanguageMode.engDigor:
        return 'en';
      case LanguageMode.digRussian:
        return 'dig';
      case LanguageMode.rusDigor:
        return 'ru';
      case LanguageMode.digTurkish:
        return 'dig';
      case LanguageMode.turkDigor:
        return 'turk';
      default:
        return 'ru';
    }
  }

  String getToLanguageMode() {
    switch (state.value) {
      case LanguageMode.digEnglish:
        return 'en';
      case LanguageMode.engDigor:
        return 'dig';
      case LanguageMode.digRussian:
        return 'ru';
      case LanguageMode.rusDigor:
        return 'dig';
      case LanguageMode.digTurkish:
        return 'turk';
      case LanguageMode.turkDigor:
        return 'dig';
      default:
        return 'ru';
    }
  }
}

@Riverpod(keepAlive: true)
Future<List<WordModel>> search(SearchRef ref, {required String text}) async {
  if (text.trim().isEmpty) {
    return [];
  }
  String fromLang = '';
  String toLang = '';
  switch (ref.watch(searchModeProvider).value!) {
    case LanguageMode.digEnglish:
      fromLang = 'dig';
      toLang = 'en';
      break;
    case LanguageMode.digRussian:
      fromLang = 'dig';
      toLang = 'ru';
      break;
    case LanguageMode.digTurkish:
      fromLang = 'dig';
      toLang = 'turk';
      break;
    case LanguageMode.engDigor:
      fromLang = 'en';
      toLang = 'dig';
      break;
    case LanguageMode.rusDigor:
      fromLang = 'ru';
      toLang = 'dig';
      break;
    case LanguageMode.turkDigor:
      fromLang = 'turk';
      toLang = 'dig';
      break;
  }
  final res = await ref.read(apiClientProvider).search(text, fromLang, toLang);

  if (ref.read(splitModeProvider) && res.result.isNotEmpty) {
    ref.read(selectedBottomPanelWordIdProvider.notifier).changeStateIfItNeed(res.result.first.id);
  }
  return res.result;
}
