import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/w_cupertino_switch.dart';
import 'package:flutter/material.dart';

class SwitcherRow extends StatelessWidget {
  final String title;
  const SwitcherRow({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title, style: Theme.of(context).textTheme.headline6!.copyWith(color: greyText),),
      WCupertinoSwitch(onChange: (value){},),
    ],
  );
}
