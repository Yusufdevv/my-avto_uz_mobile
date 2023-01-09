import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextEditingController? secondController;
  final String hintText;
  final bool isOldPasword;

  const PasswordTextField({
    required this.controller,
    this.secondController,
    this.isOldPasword = false,
    Key? key,
    this.hintText = '',
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obScure = true;

  @override
  Widget build(BuildContext context) => WTextField(
      validate: (p0) {
        if (p0 == null || p0.isEmpty) {
          return 'Parolni kiriting!';
        } else if (p0.isNotEmpty &&
            !widget.isOldPasword &&
            widget.secondController != widget.controller) {
          if (widget.secondController != null &&
              (widget.secondController?.text != null &&
                  widget.secondController!.text.isNotEmpty)) {
            return 'Parol mos emas';
          }
        }
        return null;
      },
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
          .copyWith(fontSize: 14, fontWeight: FontWeight.w600, color: grey),
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
