import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/posting_ad/choose_model/presentation/widgets/number_items.dart';
import 'package:flutter/material.dart';

class ModelHeader extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 34;

  @override
  double get maxExtent => 36;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate _) => true;
  final List<String> numbers = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) =>                       Container(
    height: 36,
    color: Theme.of(context)
        .extension<ThemedColors>()!
        .whiteToDark,
    child: ListView.builder(
      itemBuilder: (context, index) =>
          NumberItems(number: numbers[index]),
      itemCount: numbers.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
    ),
  );

}

