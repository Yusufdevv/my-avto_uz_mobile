import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/posting_ad/choose_car_brand/presentation/widget/az_list.dart';
import 'package:flutter/material.dart';


class Header extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 40;

  @override
  double get maxExtent => 44;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate _) => true;
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
      BuildContext context, double shrinkOffset, bool overlapsContent) => Container(
    padding: const EdgeInsets.only( top: 3),
    color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
      child:     Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  AzList(letter: letters[index],),
              itemCount: letters.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const SizedBox(height: 4,),
          Divider(
            color: Theme.of(context).dividerColor,
          )
        ],
      )
    );
}

