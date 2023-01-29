import 'package:auto/assets/colors/color.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextEditingController? secondController;
  final TextEditingController? confirmController;
  final String hintText;
  final bool isOldPasword;

  const PasswordTextField({
    required this.controller,
    this.secondController,
    this.confirmController,
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
        style: Theme.of(context)
            .textTheme
            .headline5
            ?.copyWith(color: Colors.black),
        obscureText: passwordVisible,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.visiblePassword,
        cursorColor: black,
        obscuringCharacter: '●',
        decoration: InputDecoration(
          filled: true,
          hoverColor: const Color(0xFFF1F1F5),
          hintStyle: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(fontSize: 14, fontWeight: FontWeight.w600, color: grey),
          labelStyle: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
          hintText: widget.hintText,
          contentPadding: const EdgeInsets.only(top: 13, bottom: 13, left: 16),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFF1F1F5))),
          suffixIcon: IconButton(
            icon:
                Icon(passwordVisible ? Icons.visibility_off : Icons.visibility),
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Parolni kiriting!';
          } else if (value.isNotEmpty && !widget.isOldPasword) {
            if (widget.controller.text.length < 8) {
              return "Parol kamida 6 ta belgidan iborat bo'lishi kerak";
            }
            if (widget.secondController != null &&
                widget.secondController!.text.length < 8) {
              return "Parol kamida 6 ta belgidan iborat bo'lishi kerak";
            } else if ((widget.secondController != null ||
                    widget.secondController!.text.isNotEmpty) &&
                (widget.secondController?.text != null ||
                    widget.secondController!.text.isNotEmpty) &&
                widget.controller.text.length >= 8 &&
                widget.secondController!.text.length >= 8 &&
                widget.secondController?.text != widget.controller.text) {
              return 'Parol mos emas';
            }
          }
          return null;
        },
      );
}
//  WTextField(
      //     validate: (p0) {
      //       if (p0 == null || p0.isEmpty) {
      //         return 'Parolni kiriting!';
      //       } else if (p0.isNotEmpty &&
      //           !widget.isOldPasword &&
      //           widget.secondController!.text != widget.controller.text) {
      //         if (widget.secondController != null &&
      //             (widget.secondController?.text != null &&
      //                 widget.secondController!.text.isNotEmpty)) {
      //           return 'Parol mos emas';
      //         }
      //       }
      //       return null;
      //     },
      //     focusColor: Theme.of(context).appBarTheme.backgroundColor,
      //     borderColor: purple,
      //     cursorColor: black,
      //     isObscure: obScure,
      //     onObscure: () {
      //       setState(() {
      //         obScure = !obScure;
      //       });
      //     },
      //     hintTextStyle: Theme.of(context)
      //         .textTheme
      //         .headline2!
      //         .copyWith(fontSize: 14, fontWeight: FontWeight.w600, color: grey),
      //     textStyle: Theme.of(context)
      //         .textTheme
      //         .headline1!
      //         .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
      //     borderRadius: 8,
      //     height: 44,
      //     fillColor: Theme.of(context).appBarTheme.backgroundColor,
      //     hasBorderColor: true,
      //     controller: widget.controller,
      //     hintText: widget.hintText,
      //     disabledColor: Theme.of(context).appBarTheme.backgroundColor,
      //     onChanged: (text) {})