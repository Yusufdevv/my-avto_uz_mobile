import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const PasswordTextField({
    Key? key,
    required this.controller,
    this.hintText = '',
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obScure = true;

  @override
  Widget build(BuildContext context) => WTextField(
      focusColor: Theme.of(context).appBarTheme.backgroundColor,
      borderColor: purple,
      cursorColor: purple,
      isObscure: obScure,
      onObscure: () {
        setState(() {
          obScure = !obScure;
        });
      },
      hintTextStyle: Theme.of(context)
          .textTheme
          .headline2!
          .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
      textStyle: Theme.of(context)
          .textTheme
          .headline1!
          .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
      borderRadius: 8,
      height: 44,
      fillColor: Theme.of(context).appBarTheme.backgroundColor,
      hasBorderColor: true,
      controller: widget.controller,
      hintText: widget.hintText,
      disabledColor: Theme.of(context).appBarTheme.backgroundColor,
      onChanged: (text) {});
}
