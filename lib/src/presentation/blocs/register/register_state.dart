part of 'register_bloc.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class ShowLoadingState extends RegisterState {}

final class HideLoadingState extends RegisterState {}

final class ValidFirstNameState extends RegisterState {}

final class InValidFirstNameState extends RegisterState {}

final class ValidLastNameState extends RegisterState {}

final class InValidLastNameState extends RegisterState {}

final class ValidEmailState extends RegisterState {}

final class InValidEmailState extends RegisterState {}

final class ValidPasswordState extends RegisterState {}

final class InValidPasswordState extends RegisterState {}

final class InValidRegisterFormState extends RegisterState {
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

final class RegisterContactSuccessState extends RegisterState {}

final class RegisterContactErrorState extends RegisterState {
  final String message;

  const RegisterContactErrorState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
