import 'package:shared_preferences/shared_preferences.dart';
import 'package:tech_labs_task/src/data/sources/local/shared_preferences_keys.dart';

class GetOnboardingStatusUseCase {
  final SharedPreferences _sharedPreferences;

  GetOnboardingStatusUseCase(this._sharedPreferences);

  bool call() {
    return _sharedPreferences.getBool(SharedPreferenceKeys.onBoardingStatus) ??
        false;
  }
}
