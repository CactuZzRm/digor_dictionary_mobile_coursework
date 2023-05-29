import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/history.dart';
import '../../providers/shared_pref.dart';

part 'home_page_model.g.dart';

@Riverpod(keepAlive: true)
class TranslateMode extends _$TranslateMode {
  @override
  bool build() => false;

  void setFalse() => state = false;
  void setTrue() => state = true;
}

@Riverpod(keepAlive: true)
class SelectedWordId extends _$SelectedWordId {
  @override
  int build() => -1;

  set changeSelectedId(int id) => state = id;
}

const String _splitModeKey = 'splitModeKey';

@Riverpod(keepAlive: true)
class SplitMode extends _$SplitMode {
  late final Future<SharedPreferences> _sharedPreferences;

  @override
  bool build() {
    _sharedPreferences = ref.read(fetchSharedPreferencesProvider.future);
    return false;
  }

  Future<void> init() async {
    final shared = await _sharedPreferences;
    if (!shared.containsKey(_splitModeKey)) {
      return;
    }
    state = shared.getBool(_splitModeKey) ?? false;
  }

  set newState(bool value) {
    state = value;
    _saveState();
  }

  Future<void> _saveState() async {
    (await _sharedPreferences).setBool(_splitModeKey, state);
  }
}

@Riverpod(keepAlive: true)
class SelectedBottomPanelWordId extends _$SelectedBottomPanelWordId {
  @override
  int build() {
    _listen();
    return -1;
  }

  set id(int id) => state = id;

  Future<void> _listen() async {
    await Future.delayed(const Duration(seconds: 1));
    if (state == -1) {
      final history = ref.read(historyProvider.future);

      final list = await history;
      if (list.isNotEmpty) {
        state = list.first.id;
        return;
      }
    }
  }

  void changeStateIfItNeed(int id) {
    if (state == -1) {
      state = id;
      ref.read(selectedWordIdProvider.notifier).state = id;
    }
  }
}

const String _glossaryZoomSettingKey = 'glossaryZoomSettingKey';

enum GlossaryZoomState { little, normal, big }

@Riverpod(keepAlive: true)
class GlossaryZoom extends _$GlossaryZoom {
  late final Future<SharedPreferences> _sharedPreferences;

  @override
  double build() {
    _sharedPreferences = ref.read(fetchSharedPreferencesProvider.future);
    return 1.0;
  }

  Future<void> init() async {
    final shared = await _sharedPreferences;
    if (!shared.containsKey(_glossaryZoomSettingKey)) {
      return;
    }
    state = shared.getDouble(_glossaryZoomSettingKey) ?? 1.0;
  }

  set newState(GlossaryZoomState zoomState) {
    switch (zoomState) {
      case GlossaryZoomState.little:
        state = .9;
        break;
      case GlossaryZoomState.normal:
        state = 1;
        break;
      case GlossaryZoomState.big:
        state = 1.1;
        break;
    }
    _saveState();
  }

  Future<void> _saveState() async {
    (await _sharedPreferences).setDouble(_glossaryZoomSettingKey, state);
  }
}
