import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/word_model.dart';
import 'api_provider.dart';
import 'search.dart';
import 'shared_pref.dart';

part 'history.g.dart';

@Riverpod(keepAlive: true)
class History extends _$History {
  late final SharedPreferences sharedPreferences;
  late String _savedLangMode;
  late String _savedWordsKey;

  @override
  FutureOr<List<WordModel>> build() async {
    sharedPreferences = await ref.read(fetchSharedPreferencesProvider.future);
    final words = await langModeUpdate();
    return words;
  }

  FutureOr<List<WordModel>> langModeUpdate() async {
    _savedLangMode = sharedPreferences.getString('langMode') ?? 'digRussian';
    switch (_savedLangMode) {
      case 'digRussian':
        _savedWordsKey = 'digRusKey';
        break;
      case 'digEnglish':
        _savedWordsKey = 'digEngKey';
        break;
      case 'digTurkish':
        _savedWordsKey = 'digTurkishKey';
        break;
      case 'engDigor':
        _savedWordsKey = 'engDigorKey';
        break;
      case 'rusDigor':
        _savedWordsKey = 'rusDigorKey';
        break;
      case 'turkDigor':
        _savedWordsKey = 'turkDigorKey';
        break;
    }
    if (!sharedPreferences.containsKey(_savedWordsKey)) {
      state = const AsyncValue.data([]);
      return [];
    }
    final savedIdsString = sharedPreferences.getString(_savedWordsKey);

    if (savedIdsString == null || savedIdsString.trim().isEmpty) {
      state = const AsyncValue.data([]);
      return [];
    }
    final ids = savedIdsString.split(';').map((e) => int.parse(e)).toList();

    if (ids.isEmpty) {
      state = const AsyncValue.data([]);
      return [];
    }

    final apiClient = ref.read(apiClientProvider);
    final fromLangMode = ref.read(searchModeProvider.notifier).getFromLanguageMode();
    final toLangMode = ref.read(searchModeProvider.notifier).getToLanguageMode();
    try {
      final response = await apiClient.searchByIds({
        'ids': ids,
        'from': fromLangMode,
        'to': toLangMode,
      });
      state = AsyncValue.data(response.result);
      return response.result;
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.current);
      return [];
    }
  }

  Future<void> addWordToSaved(WordModel word) async {
    final words = state.value!;
    if (words.where((element) => element.id == word.originalId).isNotEmpty) {
      words.removeWhere((element) => element.id == word.originalId);
    }
    final newWords = [word] + words;
    state = AsyncValue.data(newWords);
    sharedPreferences.setString(_savedWordsKey, newWords.map((word) => word.originalId).join(';'));
  }

  Future<void> deleteFromHistory(WordModel word) async {
    final words = state.value ?? [];
    words.remove(word);
    state = AsyncValue.data(words);
    sharedPreferences.setString(_savedWordsKey, words.map((word) => word.originalId).join(';'));
  }

  Future<void> clearHistory() async {
    final words = state.value ?? [];
    words.clear();
    state = AsyncValue.data(words);
    sharedPreferences.setString(_savedWordsKey, '');
  }
}
