import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfilTextField extends StatefulWidget {
  const ProfilTextField({
    required this.controller,
    required this.onChanged,
    required this.hintText,
    this.suffix,
    this.isNameField = false,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final Widget? suffix;
  final bool isNameField;
  final ValueChanged<String> onChanged;
  final String hintText;

  @override
  State<ProfilTextField> createState() => _ProfilTextFieldState();
}

class _ProfilTextFieldState extends State<ProfilTextField> {
  @override
  Widget build(BuildContext context) => WTextField(
        focusColor: Theme.of(context).scaffoldBackgroundColor,
        borderColor: purple,
        cursorColor: purple,
        disabledColor: Theme.of(context).scaffoldBackgroundColor,
        textStyle: Theme.of(context)
            .textTheme
            .displayLarge!
            .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
        borderRadius: 12,
        hintText: widget.hintText,
        suffix: widget.suffix,
        hintTextStyle: Theme.of(context)
            .textTheme
            .displayLarge!
            .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
        onChanged: (tmp) {
          widget.onChanged(tmp);
        },
        controller: widget.controller,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      );
}
