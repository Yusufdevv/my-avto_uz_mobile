import 'dart:async';

import 'package:auto/assets/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SmsPinCodeFields extends StatefulWidget {
  final Color? borderColor;
  final TextEditingController controller;
  final StreamController<ErrorAnimationType> errorAnimationController;
  final VoidCallback onAutoSubmit;

  const SmsPinCodeFields(
      {this.borderColor,
      required this.controller,
      required this.errorAnimationController,
      required this.onAutoSubmit,
      Key? key})
      : super(key: key);

  @override
  State<SmsPinCodeFields> createState() => _SmsPinCodeFieldsState();
}

class _SmsPinCodeFieldsState extends State<SmsPinCodeFields> {
  @override
  Widget build(BuildContext context) => PinCodeTextField(
        errorAnimationController: widget.errorAnimationController,
        onCompleted: (value) {},
        enableActiveFill: true,
        keyboardType: TextInputType.number,
        controller: widget.controller,
        appContext: context,
        cursorColor: Theme.of(context).colorScheme.primary,
        cursorHeight: 22,
        textInputAction: TextInputAction.next,
        autoDismissKeyboard: true,
        autoDisposeControllers: false,
        autoFocus: true,
        textStyle: ThemeData.light().textTheme.headline1!.copyWith(fontSize: 20),
        length: 6,
        animationType: AnimationType.scale,
        showCursor: true,
        pinTheme: PinTheme(
          activeColor: Theme.of(context).colorScheme.primary,
          selectedColor: Theme.of(context).colorScheme.primary,
          inactiveFillColor: borderCircular,
          activeFillColor: borderCircular,
          inactiveColor: widget.borderColor ?? border,
          borderWidth: 1.5,
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(8),
          selectedFillColor: white,
          fieldHeight: 43,
          fieldWidth: 43,
          fieldOuterPadding: EdgeInsets.zero,
        ),
        animationDuration: const Duration(milliseconds: 200),
        onChanged: (text) {
          if (text.length == 6) {
            widget.onAutoSubmit();
          }
        },
        beforeTextPaste: (text) => false,
      );
}
