import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_labs_task/src/core/resources/data_state.dart';
import 'package:tech_labs_task/src/domain/entities/contacts/contacts.dart';
import 'dart:async';

import 'package:tech_labs_task/src/domain/usecases/contacts/add_contact_use_case.dart';
import 'package:tech_labs_task/src/domain/usecases/contacts/save_contact_id_use_case.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AddContactUseCase _addContactUseCase;
  final SaveContactIdUseCase _saveContactIdUseCase;

  RegisterBloc(
    this._addContactUseCase,
    this._saveContactIdUseCase,
  ) : super(RegisterInitial()) {
    on<ValidateFirstNameEvent>(_onValidateFirstNameEvent);
    on<ValidateLastNameEvent>(_onValidateLastNameEvent);
    on<ValidateEmailEvent>(_onValidateEmailEvent);
    on<ValidatePasswordEvent>(_onValidatePasswordEvent);
    on<RegisterContactEvent>(_onRegisterContactEvent);
  }

  FutureOr<void> _onValidateFirstNameEvent(
    ValidateFirstNameEvent event,
    Emitter<RegisterState> emit,
  ) {
    if(event.firstName.isNotEmpty) {
      emit(ValidFirstNameState());
    } else {
      emit(InValidFirstNameState());
    }
  }

  FutureOr<void> _onValidateLastNameEvent(
      ValidateLastNameEvent event,
      Emitter<RegisterState> emit,
      ) {
    if(event.lastName.isNotEmpty) {
      emit(ValidLastNameState());
    } else {
      emit(InValidLastNameState());
    }
  }

  FutureOr<void> _onValidateEmailEvent(
      ValidateEmailEvent event,
      Emitter<RegisterState> emit,
      ) {
    if(event.email.isNotEmpty && _isEmailValid(event.email)) {
      emit(ValidEmailState());
    } else {
      emit(InValidEmailState());
    }
  }

  FutureOr<void> _onValidatePasswordEvent(
      ValidatePasswordEvent event,
      Emitter<RegisterState> emit,
      ) {
    if(event.password.isNotEmpty) {
      emit(ValidPasswordState());
    } else {
      emit(InValidPasswordState());
    }
  }


  FutureOr<void> _onRegisterContactEvent(
    RegisterContactEvent event,
    Emitter<RegisterState> emit,
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

    final result = await _addContactUseCase(event.contact);
    if (result is DataSuccess) {
      await _saveContactIdUseCase(result.data ?? "");
      emit(RegisterContactSuccessState());
    } else {
      emit(RegisterContactErrorState(message: result.message ?? ""));
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
