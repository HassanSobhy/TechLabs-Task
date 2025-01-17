import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech_labs_task/generated/l10n.dart';
import 'package:tech_labs_task/src/config/route/routes_manager.dart';
import 'package:tech_labs_task/src/config/theme/app_theme.dart';
import 'package:tech_labs_task/src/core/utils/main_bloc_observer.dart';
import 'package:tech_labs_task/src/di/injector.dart';
import 'package:tech_labs_task/src/domain/usecases/contacts/get_contact_id_use_case.dart';
import 'package:tech_labs_task/src/domain/usecases/main/get_onboarding_status_use_case.dart';
import 'package:tech_labs_task/src/presentation/blocs/main/main_cubit.dart';
import 'package:tech_labs_task/src/presentation/blocs/profile/profile_bloc.dart';
import 'package:tech_labs_task/src/presentation/blocs/register/register_bloc.dart';

Future<void> main() async {
  await _init();
  String initialRoute = await _determineInitialRoute();
  runApp(MyApp(
    initialRoute: initialRoute,
  ));
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  await dotenv.load(
    fileName: ".env",
  );

  Bloc.observer = const MainBlocObserver();
}

Future<String> _determineInitialRoute() async {
  bool isUserLogged = await _isUserLogged();
  if (isUserLogged) {
    return Routes.landing;
  } else {
    bool isOnboardingCompleted = _isOnBoardingCompleted();
    if (isOnboardingCompleted) {
      return Routes.register;
    }
    {
      return Routes.start;
    }
  }
}

Future<bool> _isUserLogged() async {
  String contactId = await GetContactIdUseCase(injector())();
  return contactId.isNotEmpty;
}

bool _isOnBoardingCompleted() {
  bool onBoardingStatus = GetOnboardingStatusUseCase(injector())();
  return onBoardingStatus;
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({
    super.key,
    required this.initialRoute,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainCubit>(create: (context) => injector()),
        BlocProvider<RegisterBloc>(create: (context) => injector()),
        BlocProvider<ProfileBloc>(create: (context) => injector()),
      ],
      child: BlocBuilder<MainCubit, Locale>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Tech Labs Task',
            theme: AppTheme(state.languageCode).light,
            themeMode: ThemeMode.light,
            initialRoute: initialRoute,
            onGenerateRoute: RoutesManager.getRoute,
            locale: state,
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }
}
