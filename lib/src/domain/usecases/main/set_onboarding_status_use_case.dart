import 'package:shared_preferences/shared_preferences.dart';
import 'package:tech_labs_task/src/data/sources/local/shared_preferences_keys.dart';

class SetOnboardingStatusUseCase {
  final SharedPreferences _sharedPreferences;

  SetOnboardingStatusUseCase(this._sharedPreferences);

  Future<bool> call(bool status) {
    return _sharedPreferences.setBool(SharedPreferenceKeys.onBoardingStatus, status);
  }
}
