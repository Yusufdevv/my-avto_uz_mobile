import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isOldPasword;
  final ValueChanged<String> onChanged;

  const PasswordTextField({
    required this.onChanged,
    required this.controller,
    this.isOldPasword = false,
    Key? key,
    this.hintText = '',
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  // bool obScure = true;
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: widget.controller,
        obscureText: passwordVisible,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.visiblePassword,
        cursorColor: black,
        cursorWidth: 1,
        obscuringCharacter: '•',
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[\da-zA-Z!@#$&*~]')),
        ],
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          filled: true,
          hoverColor: const Color(0xFFFAFAFB),
          hintStyle: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontSize: 14, fontWeight: FontWeight.w600, color: LightThemeColors.displayMedium),
          labelStyle: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
          hintText: widget.hintText,
          contentPadding: const EdgeInsets.only(top: 13, bottom: 13, left: 16),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: Theme.of(context)
                      .extension<ThemedColors>()!
                      .solitudeToDarkRider)),
          suffixIcon: IconButton(
            color: grey,
            splashRadius: 1,
            focusColor: grey,
            icon: Icon(passwordVisible
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined),
            onPressed: () {
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
          ),
          suffixIconColor: grey,
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: orange)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: orange)),
          focusColor: Theme.of(context).appBarTheme.backgroundColor,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: purple)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFF1F1F5))),
        ),
      );
}
