part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ShowLoadingState extends ProfileState {}

final class HideLoadingState extends ProfileState {}

final class GetProfileSuccessState extends ProfileState {
  final Contact contact;

  const GetProfileSuccessState({
    required this.contact,
  });

  @override
  List<Object> get props => [
        contact,
      ];
}

final class GetProfileErrorState extends ProfileState {
  final String message;

  const GetProfileErrorState({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}

final class ValidFirstNameState extends ProfileState {}

final class InValidFirstNameState extends ProfileState {}

final class ValidLastNameState extends ProfileState {}

final class InValidLastNameState extends ProfileState {}

final class ValidEmailState extends ProfileState {}

final class InValidEmailState extends ProfileState {}

final class ValidPasswordState extends ProfileState {}

final class InValidPasswordState extends ProfileState {}

final class InValidRegisterFormState extends ProfileState {
  final bool isFirsNameValid;
  final bool isLastNameValid;
  final bool isEmailValid;
  final bool isPasswordValid;

  const InValidRegisterFormState({
    required this.isFirsNameValid,
    required this.isLastNameValid,
    required this.isEmailValid,
    required this.isPasswordValid,
  });
}

final class UpdateProfileSuccessState extends ProfileState {
  final Contact contact;

  const UpdateProfileSuccessState({
    required this.contact,
  });

  @override
  List<Object> get props => [
        contact,
      ];
}

final class UpdateProfileErrorState extends ProfileState {
  final String message;

  const UpdateProfileErrorState({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}
