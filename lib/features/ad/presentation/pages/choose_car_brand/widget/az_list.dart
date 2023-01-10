import 'package:auto/assets/colors/color.dart';
import 'package:flutter/material.dart';

class AzList extends StatefulWidget {
  final String letter;

  const AzList({required this.letter, Key? key}) : super(key: key);

  @override
  State<AzList> createState() => _AzListState();
}

class _AzListState extends State<AzList> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          print('=>=>=>=> selectec letter <=<=<=<=');
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 4),
          child: Text(
            widget.letter,
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
