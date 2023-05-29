import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/word_model.dart';
import '../../providers/api_provider.dart';
import '../../providers/search.dart';
import '../../providers/shared_pref.dart';

part 'word_page_model.g.dart';

@riverpod
Future<WordModel> fetchWord(FetchWordRef ref, {required int id}) async {
  final res =
      (await ref.read(apiClientProvider).searchById(id, ref.read(searchModeProvider.notifier).getLanguageMode()))
          .result;
  return res;
}

const String _articleZoomSettingKey = 'articleZoomSettingKey';

@Riverpod(keepAlive: true)
class ArticleZoom extends _$ArticleZoom {
  late final Future<SharedPreferences> _sharedPreferences;

  static const _zoomChangeDifferens = .1;
  @override
  double build() {
    _sharedPreferences = ref.read(fetchSharedPreferencesProvider.future);
    return 1.0;
  }

  Future<void> init() async {
    final shared = await _sharedPreferences;
    if (!shared.containsKey(_articleZoomSettingKey)) {
      return;
    }
    state = shared.getDouble(_articleZoomSettingKey) ?? 1.0;
  }

  void incrementZoom() {
    state += _zoomChangeDifferens;
    _saveState();
  }

  void decrementZoom() {
    state -= _zoomChangeDifferens;
    _saveState();
  }

  Future<void> _saveState() async {
    (await _sharedPreferences).setDouble(_articleZoomSettingKey, state);
  }
}

enum ExampleModeEnum { show, hide }

@riverpod
class ExampleMode extends _$ExampleMode {
  @override
  ExampleModeEnum build() => ExampleModeEnum.show;

  void toggleExampleMode() => state = state == ExampleModeEnum.show ? ExampleModeEnum.hide : ExampleModeEnum.show;
}
