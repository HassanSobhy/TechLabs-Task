import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_labs_task/generated/l10n.dart';
import 'package:tech_labs_task/src/config/theme/colors_manager.dart';
import 'package:tech_labs_task/src/core/base/widget/base_stateful_widget.dart';
import 'package:tech_labs_task/src/core/resources/image_paths.dart';
import 'package:tech_labs_task/src/core/utils/helpers/show_snack_bar.dart';
import 'package:tech_labs_task/src/domain/entities/contacts/contacts.dart';
import 'package:tech_labs_task/src/presentation/blocs/profile/profile_bloc.dart';
import 'package:tech_labs_task/src/presentation/screens/profile/widgets/profile_action_widget.dart';
import 'package:tech_labs_task/src/presentation/screens/profile/widgets/profile_header_widget.dart';
import 'package:tech_labs_task/src/presentation/widgets/custom_text_field_widget.dart';

class ProfileScreen extends BaseStatefulWidget {
  const ProfileScreen({super.key});

  @override
  BaseState<ProfileScreen> baseCreateState() => _ProfileScreenState();
}

class _ProfileScreenState extends BaseState<ProfileScreen> {
  ProfileBloc get _bloc => BlocProvider.of<ProfileBloc>(context);

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _firstNameError;
  String? _lastNameError;
  String? _emailError;
  String? _passwordError;

  bool _isEditing = false;
  Contact _contact = const Contact();

  @override
  void initState() {
    super.initState();
    _bloc.add(GetProfileEvent());
  }

  @override
  Widget baseBuild(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: BlocConsumer<ProfileBloc, ProfileState>(
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
            } else if (state is GetProfileSuccessState) {
              _contact = state.contact;
              _firstNameController.text = _contact.firstName;
              _lastNameController.text = _contact.lastName;
              _emailController.text = _contact.email;
              _passwordController.text = _contact.password;
            } else if (state is GetProfileErrorState) {
              showSnackBar(
                context: context,
                message: state.message,
                color: ColorsManager.primary,
                icon: ImagePaths.error,
              );
            } else if (state is UpdateProfileSuccessState) {
              _contact = state.contact;
              showSnackBar(
                context: context,
                message: "Success",
                color: Colors.green,
                icon: ImagePaths.success,
              );
              _isEditing = false;
            } else if (state is UpdateProfileErrorState) {
              showSnackBar(
                context: context,
                message: state.message,
                color: ColorsManager.primary,
                icon: ImagePaths.error,
              );
            }
          },
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        ProfileHeaderWidget(
                          onTap: () {
                            _navigateBack(context);
                          },
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        CustomTextFieldWidget(
                          controller: _firstNameController,
                          onChange: (value) {
                            _validateFirstNameEvent(value);
                          },
                          inputType: TextInputType.text,
                          inputAction: TextInputAction.next,
                          height: 48,
                          hintColor: Colors.grey,
                          borderRadius: 12,
                          hintText: S.of(context).firstName,
                          isEnabled: _isEditing,
                          isError: _firstNameError != null,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomTextFieldWidget(
                          controller: _lastNameController,
                          onChange: (value) {
                            _validateLastNameEvent(value);
                          },
                          inputType: TextInputType.text,
                          inputAction: TextInputAction.next,
                          height: 48,
                          hintColor: Colors.grey,
                          borderRadius: 12,
                          hintText: S.of(context).lastName,
                          isEnabled: _isEditing,
                          isError: _lastNameError != null,
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
                          borderRadius: 12,
                          hintText: S.of(context).email,
                          isEnabled: _isEditing,
                          isError: _emailError != null,
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
                          borderRadius: 12,
                          hintText: S.of(context).password,
                          isEnabled: _isEditing,
                          isPassword: true,
                          isError: _passwordError != null,
                          isObscureText: false,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Spacer(),
                        ProfileActionWidget(
                          isEditing: _isEditing,
                          onEdit: () {
                            setState(() {
                              _isEditing = true;
                            });
                          },
                          onCancel: () {
                            setState(() {
                              _isEditing = false;
                            });
                          },
                          onSave: () {
                            _updateProfileEvent();
                          },
                        ),
                        const SizedBox(
                          height: 24,
                        )
                      ],
                    ),
                  ),
                )
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

  void _updateProfileEvent() {
    _bloc.add(
      UpdateProfileEvent(
        contact: Contact(
          id: _contact.id,
          firstName:
          _firstNameController.text,
          lastName:
          _lastNameController.text,
          email: _emailController.text,
          password:
          _passwordController.text,
        ),
      ),
    );
  }


  void _navigateBack(BuildContext context) {
    Navigator.pop(context);
  }
}
