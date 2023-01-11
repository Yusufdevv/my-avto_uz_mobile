import 'package:auto/assets/colors/color.dart';
import 'package:flutter/material.dart';

class AzList extends StatelessWidget {
  final bool isSelected;
  final String letter;

  const AzList(
      {required this.isSelected,
      required this.letter,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 4),
    child: Text(
      letter,
      style: isSelected
          ? Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: greyText)
          : Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: warmerGrey),
    ),
  );
}
