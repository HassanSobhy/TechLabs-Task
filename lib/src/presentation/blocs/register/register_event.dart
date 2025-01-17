part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

final class ValidateFirstNameEvent extends RegisterEvent {
  final String firstName;

  const ValidateFirstNameEvent({
    required this.firstName,
  });

  @override
  List<Object> get props => [
    firstName,
  ];
}

final class ValidateLastNameEvent extends RegisterEvent {
  final String lastName;

  const ValidateLastNameEvent({
    required this.lastName,
  });

  @override
  List<Object> get props => [
    lastName,
  ];
}
final class ValidateEmailEvent extends RegisterEvent {
  final String email;

  const ValidateEmailEvent({
    required this.email,
  });

  @override
  List<Object> get props => [
    email,
  ];
}

final class ValidatePasswordEvent extends RegisterEvent {
  final String password;

  const ValidatePasswordEvent({
    required this.password,
  });

  @override
  List<Object> get props => [
    password,
  ];

}



final class RegisterContactEvent extends RegisterEvent {
  final Contact contact;

  const RegisterContactEvent({
    required this.contact,
  });

  @override
  List<Object> get props => [
        contact,
      ];
}
