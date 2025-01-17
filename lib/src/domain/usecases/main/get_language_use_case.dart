import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tech_labs_task/src/data/sources/local/shared_preferences_keys.dart';

class GetLanguageUseCase {
  final SharedPreferences sharedPreferences;

  GetLanguageUseCase(this.sharedPreferences);

  String call() {
    return sharedPreferences.getString(SharedPreferenceKeys.language) ??
        window.locale.languageCode;
  }
}
