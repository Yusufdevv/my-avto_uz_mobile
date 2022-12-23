import 'package:auto/assets/colors/color.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:flutter/material.dart';

class ProfilTextField extends StatelessWidget {
  const ProfilTextField({
    required this.controller,
     this.suffix,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) => WTextField(
      focusColor: Theme.of(context).scaffoldBackgroundColor,
      borderColor: purple,
      cursorColor: purple,
      disabledColor: Theme.of(context).scaffoldBackgroundColor,
      textStyle: Theme.of(context)
          .textTheme
          .headline1!
          .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
      borderRadius: SizeConfig.h(12),
      hintText: '',
      suffix: suffix,
      hintTextStyle: Theme.of(context)
          .textTheme
          .headline1!
          .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
      onChanged: (tmp) {},
      controller: controller,
      contentPadding: EdgeInsets.symmetric(horizontal: SizeConfig.h(16)),
    );
}
