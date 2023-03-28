import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersList extends StatelessWidget {
  final String letter;
  final Color color;
  final VoidCallback onTap;
  final bool isSelected;

  const CharactersList({
    required this.isSelected,
    required this.letter,
    required this.color,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          color: color,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            letter,
            style: isSelected
                ? Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: greyText)
                : Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: warmerGrey),
          ),
        ),
      );
}
