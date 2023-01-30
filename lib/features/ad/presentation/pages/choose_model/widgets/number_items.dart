import 'package:auto/assets/colors/color.dart';
import 'package:flutter/material.dart';

class NumberItems extends StatefulWidget {
  final String number;

  const NumberItems({required this.number, Key? key}) : super(key: key);

  @override
  State<NumberItems> createState() => _NumberItemsState();
}

class _NumberItemsState extends State<NumberItems> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            widget.number,
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
        ),
      );
}
