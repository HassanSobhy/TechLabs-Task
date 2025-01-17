import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_labs_task/generated/l10n.dart';
import 'package:tech_labs_task/src/config/route/routes_manager.dart';
import 'package:tech_labs_task/src/config/theme/colors_manager.dart';
import 'package:tech_labs_task/src/core/base/widget/base_stateful_widget.dart';
import 'package:tech_labs_task/src/core/resources/image_paths.dart';
import 'package:tech_labs_task/src/core/utils/helpers/show_snack_bar.dart';
import 'package:tech_labs_task/src/domain/entities/contacts/contacts.dart';
import 'package:tech_labs_task/src/presentation/blocs/register/register_bloc.dart';
import 'package:tech_labs_task/src/presentation/screens/register/register_header_widget.dart';
import 'package:tech_labs_task/src/presentation/widgets/custom_text_field_widget.dart';

class RegisterScreen extends BaseStatefulWidget {
  const RegisterScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _RegisterScreenState();
}

class _RegisterScreenState extends BaseState<RegisterScreen> {
  RegisterBloc get _bloc => BlocProvider.of<RegisterBloc>(context);

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _firstNameError;
  String? _lastNameError;
  String? _emailError;
  String? _passwordError;

  @override
  Widget baseBuild(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: BlocConsumer<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is ShowLoadingState) {
              showLoading();
            } else if (state is HideLoadingState) {
              hideLoading();
            } else if (state is ValidFirstNameState) {
              _firstNameError = null;
            } else if (state is InValidFirstNameState) {
              _firstNameError = "";
            } else if (state is ValidLastNameState) {
              _lastNameError = null;
            } else if (state is InValidLastNameState) {
              _lastNameError = "";
            } else if (state is ValidEmailState) {
              _emailError = null;
            } else if (state is InValidEmailState) {
              _emailError = "";
            } else if (state is ValidPasswordState) {
              _passwordError = null;
            } else if (state is InValidPasswordState) {
              _passwordError = "";
            } else if (state is InValidRegisterFormState) {
              _firstNameError = state.isFirsNameValid ? null : "";
              _lastNameError = state.isLastNameValid ? null : "";
              _emailError = state.isEmailValid ? null : "";
              _passwordError = state.isPasswordValid ? null : "";
            } else if (state is RegisterContactSuccessState) {
              _navigateToLandingScreen(context);
            } else if (state is RegisterContactErrorState) {
              showSnackBar(
                context: context,
                message: state.message,
                color: ColorsManager.primary,
                icon: ImagePaths.success,
              );
            }
          },
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RegisterHeaderWidget(),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(ImagePaths.registerBackground),
                              fit: BoxFit.cover,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 24,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomTextFieldWidget(
                                      controller: _firstNameController,
                                      onChange: (value) {
                                        _validateFirstNameEvent(value);
                                      },
                                      inputType: TextInputType.text,
                                      inputAction: TextInputAction.next,
                                      height: 48,
                                      hintColor: Colors.grey,
                                      isError: _firstNameError == null
                                          ? false
                                          : true,
                                      borderRadius: 12,
                                      hintText: S.of(context).firstName,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: CustomTextFieldWidget(
                                      controller: _lastNameController,
                                      onChange: (value) {
                                        _validateLastNameEvent(value);
                                      },
                                      inputType: TextInputType.text,
                                      inputAction: TextInputAction.next,
                                      height: 48,
                                      hintColor: Colors.grey,
                                      isError:
                                          _lastNameError == null ? false : true,
                                      borderRadius: 12,
                                      hintText: S.of(context).lastName,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              CustomTextFieldWidget(
                                controller: _emailController,
                                onChange: (value) {
                                  _validateEmailEvent(value);
                                },
                                inputType: TextInputType.text,
                                inputAction: TextInputAction.next,
                                height: 48,
                                hintColor: Colors.grey,
                                isError: _emailError == null ? false : true,
                                borderRadius: 12,
                                hintText: S.of(context).email,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              CustomTextFieldWidget(
                                controller: _passwordController,
                                onChange: (value) {
                                  _validatePasswordEvent(value);
                                },
                                inputType: TextInputType.text,
                                inputAction: TextInputAction.next,
                                height: 48,
                                hintColor: Colors.grey,
                                isError: _passwordError == null ? false : true,
                                borderRadius: 12,
                                hintText: S.of(context).password,
                                isPassword: true,
                              ),
                              Expanded(
                                  child: SizedBox(
                                height: 24,
                              )),
                              ElevatedButton(
                                style: Theme.of(context)
                                    .elevatedButtonTheme
                                    .style
                                    ?.copyWith(
                                      fixedSize: WidgetStateProperty.all(
                                        Size(
                                          MediaQuery.of(context).size.width,
                                          49,
                                        ),
                                      ),
                                    ),
                                onPressed: () {
                                  _registerUserEvent();
                                },
                                child: Text(
                                  S.of(context).register,
                                ),
                              ),
                              const SizedBox(
                                height: 48,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _validatePasswordEvent(String value) {
    _bloc.add(ValidatePasswordEvent(password: value));
  }

  void _validateEmailEvent(String value) {
    _bloc.add(ValidateEmailEvent(email: value));
  }

  void _validateLastNameEvent(String value) {
    _bloc.add(ValidateLastNameEvent(lastName: value));
  }

  void _validateFirstNameEvent(String value) {
    _bloc.add(ValidateFirstNameEvent(firstName: value));
  }

  void _registerUserEvent() {
    _bloc.add(
      RegisterContactEvent(
        contact: Contact(
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
          email: _emailController.text,
          password: _passwordController.text,
        ),
      ),
    );
  }

  void _navigateToLandingScreen(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.landing,
      (route) => false,
    );
  }
}
