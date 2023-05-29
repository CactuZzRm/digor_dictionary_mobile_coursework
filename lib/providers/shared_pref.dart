import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_pref.g.dart';

@riverpod
Future<SharedPreferences> fetchSharedPreferences(FetchSharedPreferencesRef ref) async {
  final sharedPrefences = await SharedPreferences.getInstance();
  return sharedPrefences;
}