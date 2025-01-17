import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_labs_task/src/config/theme/colors_manager.dart';
import 'package:tech_labs_task/src/core/resources/image_paths.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onChange;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final String hintText;
  final double height;
  final Color? hintColor;
  final bool isError;
  final double borderRadius;
  final bool isPassword;
  final bool isEnabled;
  final bool isObscureText;

  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    required this.onChange,
    required this.inputType,
    required this.inputAction,
    required this.hintText,
    this.height = 48,
    this.hintColor,
    this.isError = false,
    this.borderRadius = 12,
    this.isPassword = false,
    this.isEnabled = true,
    this.isObscureText = true,
  });

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  bool _showPassword = true;
  String _passwordIcon = ImagePaths.showPassword;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      controller: widget.controller,
      onChanged: (value) {
        widget.onChange(value);
      },
      keyboardType: widget.inputType,
      textInputAction: widget.inputAction,
      textAlign: TextAlign.start,
      enabled: widget.isEnabled,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: widget.isEnabled ? ColorsManager.black : Color(0xFFB9B9B9),
          ),
      obscureText: widget.isPassword ? true : false,
      decoration: InputDecoration(
        fillColor: ColorsManager.white,
        filled: true,
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: widget.hintColor,
            ),
        suffixIcon: widget.isPassword
            ? widget.isObscureText ? IconButton(
                icon: SvgPicture.asset(_passwordIcon),
                onPressed: _toggleVisibilityIcon,
              ) : null
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: _isError(),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: _isError(),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: _isError(),
            width: 1,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: _isError(),
            width: 1,
          ),
        ),
      ),
    );
  }

  Color _isError() {
    return widget.isError ? ColorsManager.primary : Color(0xFFE8E8E8);
  }

  void _toggleVisibilityIcon() {
    setState(() {
      _showPassword = !_showPassword;
      if (_showPassword) {
        _passwordIcon = ImagePaths.showPassword;
      } else {
        _passwordIcon = ImagePaths.hidePassword;
      }
    });
  }
}
