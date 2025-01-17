import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_labs_task/src/domain/usecases/main/get_language_use_case.dart';
import 'package:tech_labs_task/src/domain/usecases/main/set_language_use_case.dart';

class MainCubit extends Cubit<Locale> {
  final GetLanguageUseCase _getLanguageUseCase;
  final SetLanguageUseCase _setLanguageUseCase;

  MainCubit(
    this._getLanguageUseCase,
    this._setLanguageUseCase,
  ) : super(Locale(PlatformDispatcher.instance.locale.languageCode)) {
    getLanguage();
  }

  void getLanguage() async {
    final language = _getLanguageUseCase();
    await _setLanguageUseCase(language);
    emit(Locale(language));
  }
}
