import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:flutter/material.dart';

class ProfileDivider extends StatelessWidget {
  const ProfileDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>  Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          height: 1,
          color: Theme.of(context).extension<WTextFieldStyle>()!.borderColor,
         
      );
}
