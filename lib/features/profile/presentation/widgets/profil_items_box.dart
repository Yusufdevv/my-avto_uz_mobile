import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfilItemsBox extends StatelessWidget {
  ProfilItemsBox({
    required this.widgets,
    Key? key,
    this.marginBottom = 0,
    this.marginTop = 0,
  }) : super(key: key);
  final List<Widget> widgets;
  double? marginTop;
  double? marginBottom;
  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(top: marginTop!, bottom: marginBottom!),
        decoration: BoxDecoration(
          color: Theme.of(context).extension<ThemedColors>()!.whiteToNero1,
          borderRadius: BorderRadius.circular(SizeConfig.h(12)),
          border: Border.all(
              color:
                  Theme.of(context).extension<WTextFieldStyle>()!.borderColor),
        ),
        child: Column(children: widgets),
      );
}
