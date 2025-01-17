import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tech_labs_task/src/core/utils/custom_interceptors.dart';
import 'package:tech_labs_task/src/data/repositories/contacts_repository_implementation.dart';
import 'package:tech_labs_task/src/data/sources/remote/api_keys.dart';
import 'package:tech_labs_task/src/data/sources/remote/crm/contacts/contacts_api_service.dart';
import 'package:tech_labs_task/src/domain/repositories/contacts_repository.dart';
import 'package:tech_labs_task/src/domain/usecases/contacts/add_contact_use_case.dart';
import 'package:tech_labs_task/src/domain/usecases/contacts/delete_contact_id_use_case.dart';
import 'package:tech_labs_task/src/domain/usecases/contacts/get_contact_by_id_use_case.dart';
import 'package:tech_labs_task/src/domain/usecases/contacts/get_contact_id_use_case.dart';
import 'package:tech_labs_task/src/domain/usecases/contacts/save_contact_id_use_case.dart';
import 'package:tech_labs_task/src/domain/usecases/contacts/update_contact_use_case.dart';
import 'package:tech_labs_task/src/domain/usecases/main/get_language_use_case.dart';
import 'package:tech_labs_task/src/domain/usecases/main/get_onboarding_status_use_case.dart';
import 'package:tech_labs_task/src/domain/usecases/main/set_language_use_case.dart';
import 'package:tech_labs_task/src/domain/usecases/main/set_onboarding_status_use_case.dart';
import 'package:tech_labs_task/src/presentation/blocs/main/main_cubit.dart';
import 'package:tech_labs_task/src/presentation/blocs/profile/profile_bloc.dart';
import 'package:tech_labs_task/src/presentation/blocs/register/register_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector.registerLazySingleton(
    () => Dio()
      ..options.baseUrl = APIKeys.baseUrl
      ..interceptors.add(
        CustomInterceptors(),
      ),
  );

  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  injector.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );

  AndroidOptions getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  final storage = FlutterSecureStorage(aOptions: getAndroidOptions());

  injector.registerSingleton<FlutterSecureStorage>(storage);

  injector.registerSingleton<ContactsAPIService>(
    ContactsAPIService(injector()),
  );

  injector.registerFactory<ContactsRepository>(
    () => ContactsRepositoryImplementation(
      injector(),
      injector(),
    ),
  );
  injector.registerFactory<GetLanguageUseCase>(
    () => GetLanguageUseCase(injector()),
  );

  injector.registerFactory<SetLanguageUseCase>(
    () => SetLanguageUseCase(injector()),
  );

  injector.registerFactory<GetOnboardingStatusUseCase>(
    () => GetOnboardingStatusUseCase(injector()),
  );

  injector.registerFactory<SetOnboardingStatusUseCase>(
    () => SetOnboardingStatusUseCase(injector()),
  );

  injector.registerFactory<AddContactUseCase>(
    () => AddContactUseCase(injector()),
  );

  injector.registerFactory<SaveContactIdUseCase>(
    () => SaveContactIdUseCase(injector()),
  );

  injector.registerFactory<GetContactIdUseCase>(
        () => GetContactIdUseCase(injector()),
  );

  injector.registerFactory<DeleteContactIdUseCase>(
        () => DeleteContactIdUseCase(injector()),
  );


  injector.registerFactory<GetContactByIdUseCase>(
    () => GetContactByIdUseCase(injector()),
  );

  injector.registerFactory<UpdateContactUseCase>(
    () => UpdateContactUseCase(injector()),
  );

  injector.registerFactory<MainCubit>(
    () => MainCubit(
      injector(),
      injector(),
    ),
  );

  injector.registerFactory<RegisterBloc>(
    () => RegisterBloc(
      injector(),
      injector(),
    ),
  );

  injector.registerFactory<ProfileBloc>(
    () => ProfileBloc(
      injector(),
      injector(),
      injector(),
    ),
  );
}
