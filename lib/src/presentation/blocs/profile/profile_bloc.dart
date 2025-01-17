import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_labs_task/src/core/resources/data_state.dart';
import 'package:tech_labs_task/src/domain/entities/contacts/contacts.dart';
import 'package:tech_labs_task/src/domain/usecases/contacts/get_contact_by_id_use_case.dart';
import 'package:tech_labs_task/src/domain/usecases/contacts/get_contact_id_use_case.dart';
import 'package:tech_labs_task/src/domain/usecases/contacts/update_contact_use_case.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetContactIdUseCase _getContactIdUseCase;
  final GetContactByIdUseCase _getContactByIdUseCase;
  final UpdateContactUseCase _updateContactUseCase;

  ProfileBloc(
    this._getContactIdUseCase,
    this._getContactByIdUseCase,
    this._updateContactUseCase,
  ) : super(ProfileInitial()) {
    on<GetProfileEvent>(_onGetProfileEvent);
    on<ValidateFirstNameEvent>(_onValidateFirstNameEvent);
    on<ValidateLastNameEvent>(_onValidateLastNameEvent);
    on<ValidateEmailEvent>(_onValidateEmailEvent);
    on<ValidatePasswordEvent>(_onValidatePasswordEvent);

    on<UpdateProfileEvent>(_onUpdateProfileEvent);
  }

  FutureOr<void> _onGetProfileEvent(
    GetProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ShowLoadingState());
    final String contactId = await _getContactIdUseCase();
    final result = await _getContactByIdUseCase(contactId);
    if (result is DataSuccess) {
      emit(GetProfileSuccessState(
        contact: result.data ?? Contact(),
      ));
    } else {
      emit(GetProfileErrorState(
        message: result.message ?? "",
      ));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onValidateFirstNameEvent(
      ValidateFirstNameEvent event,
      Emitter<ProfileState> emit,
      ) {
    if(event.firstName.isNotEmpty) {
      emit(ValidFirstNameState());
    } else {
      emit(InValidFirstNameState());
    }
  }

  FutureOr<void> _onValidateLastNameEvent(
      ValidateLastNameEvent event,
      Emitter<ProfileState> emit,
      ) {
    if(event.lastName.isNotEmpty) {
      emit(ValidLastNameState());
    } else {
      emit(InValidLastNameState());
    }
  }

  FutureOr<void> _onValidateEmailEvent(
      ValidateEmailEvent event,
      Emitter<ProfileState> emit,
      ) {
    if(event.email.isNotEmpty && _isEmailValid(event.email)) {
      emit(ValidEmailState());
    } else {
      emit(InValidEmailState());
    }
  }

  FutureOr<void> _onValidatePasswordEvent(
      ValidatePasswordEvent event,
      Emitter<ProfileState> emit,
      ) {
    if(event.password.isNotEmpty) {
      emit(ValidPasswordState());
    } else {
      emit(InValidPasswordState());
    }
  }


  FutureOr<void> _onUpdateProfileEvent(
    UpdateProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    if (!_isFormValid(contact: event.contact)) {
      emit(InValidRegisterFormState(
        isFirsNameValid: event.contact.firstName.isNotEmpty,
        isLastNameValid: event.contact.lastName.isNotEmpty,
        isEmailValid: event.contact.email.isNotEmpty &&
            _isEmailValid(event.contact.email),
        isPasswordValid: event.contact.password.isNotEmpty,
      ));
      return;
    }
    emit(ShowLoadingState());
    final result = await _updateContactUseCase(event.contact);
    if (result is DataSuccess) {
      emit(UpdateProfileSuccessState(
        contact: event.contact,
      ));
    } else {
      emit(UpdateProfileErrorState(
        message: result.message ?? "",
      ));
    }
    emit(HideLoadingState());
  }


  bool _isEmailValid(String email) {
    const String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    var regExp = RegExp(pattern);

    return regExp.hasMatch(email.trim());
  }

  bool _isFormValid({
    required Contact contact,
  }) {
    return contact.firstName.isNotEmpty &&
        contact.lastName.isNotEmpty &&
        contact.email.isNotEmpty &&
        _isEmailValid(contact.email) &&
        contact.password.isNotEmpty;
  }
}
