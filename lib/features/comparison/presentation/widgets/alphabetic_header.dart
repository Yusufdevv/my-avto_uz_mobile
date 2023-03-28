import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/material.dart';

class AlphabeticHeader extends SliverPersistentHeaderDelegate {
  final Function(String) onLetterTap;
  final String? currentLetter;

  AlphabeticHeader({required this.onLetterTap, required this.currentLetter});

  @override
  double get minExtent => 38;

  @override
  double get maxExtent => 38;

  @override
  bool shouldRebuild(AlphabeticHeader oldDelegate) =>
      currentLetter != oldDelegate.currentLetter;
  final List<String> letters = MyFunctions.getUpperLetter();

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
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    onLetterTap(letters[index]);
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    color: white,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      letters[index],
                      style: letters[index] == currentLetter
                          ? Theme.of(context).textTheme.titleLarge!.copyWith(
                                color: grey,
                              )
                          : Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: warmerGrey),
                    ),
                  ),
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
