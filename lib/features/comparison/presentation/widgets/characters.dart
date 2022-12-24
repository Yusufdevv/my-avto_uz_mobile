import 'package:auto/assets/colors/color.dart';
import 'package:flutter/material.dart';

class CharactersList extends StatefulWidget {
  final String letter;
  final Color color;
  const CharactersList({required this.letter, Key? key, required this.color})
      : super(key: key);

  @override
  State<CharactersList> createState() => _AzListState();
}

class _AzListState extends State<CharactersList> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Container(
          color: widget.color,
          padding: const EdgeInsets.symmetric(horizontal: 12),
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
