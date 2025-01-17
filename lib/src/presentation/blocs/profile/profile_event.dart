part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

final class GetProfileEvent extends ProfileEvent {
  const GetProfileEvent();
}

final class ValidateFirstNameEvent extends ProfileEvent {
  final String firstName;

  const ValidateFirstNameEvent({
    required this.firstName,
  });

  @override
  List<Object> get props => [
    firstName,
  ];
}

final class ValidateLastNameEvent extends ProfileEvent {
  final String lastName;

  const ValidateLastNameEvent({
    required this.lastName,
  });

  @override
  List<Object> get props => [
    lastName,
  ];
}
final class ValidateEmailEvent extends ProfileEvent {
  final String email;

  const ValidateEmailEvent({
    required this.email,
  });

  @override
  List<Object> get props => [
    email,
  ];
}

final class ValidatePasswordEvent extends ProfileEvent {
  final String password;

  const ValidatePasswordEvent({
    required this.password,
  });

  @override
  List<Object> get props => [
    password,
  ];

}



final class UpdateProfileEvent extends ProfileEvent {
  final Contact contact;

  const UpdateProfileEvent({
    required this.contact,
  });

  @override
  List<Object> get props => [
        contact,
      ];
}
