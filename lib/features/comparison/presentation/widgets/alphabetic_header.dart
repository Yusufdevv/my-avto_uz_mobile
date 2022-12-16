import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';

import 'characters.dart';

class AlphabeticHeader extends SliverPersistentHeaderDelegate {
  final Color color;
  AlphabeticHeader({required this.color});
  @override
  double get minExtent => 38;

  @override
  double get maxExtent => 38;

  @override
  bool shouldRebuild(AlphabeticHeader oldChild) => color != oldChild.color;
  final List<String> letters = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'Y',
    'U',
    'W',
    'Z',
  ];
  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      Container(
        decoration: BoxDecoration(
          color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
          border: const Border(
            bottom: BorderSide(color: dividerColor),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              color: dark.withOpacity(0.08),
              blurRadius: 24,
            ),
            BoxShadow(
              offset: const Offset(0, -1),
              color: dark.withOpacity(0.08),
            )
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 8),
                itemBuilder: (context, index) => CharactersList(
                  letter: letters[index],
                  color: white,
                ),
                itemCount: letters.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      );
}