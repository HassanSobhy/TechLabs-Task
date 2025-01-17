import 'package:shared_preferences/shared_preferences.dart';
import 'package:tech_labs_task/src/data/sources/local/shared_preferences_keys.dart';

class SetLanguageUseCase {
  final SharedPreferences sharedPreferences;

  SetLanguageUseCase(this.sharedPreferences);

  Future<bool> call(String language) async {
    return await sharedPreferences.setString(
        SharedPreferenceKeys.language, language);
  }
}
