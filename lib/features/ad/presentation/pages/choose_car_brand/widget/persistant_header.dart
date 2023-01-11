import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/pages/choose_car_brand/widget/az_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Header extends SliverPersistentHeaderDelegate {
  Header();
  @override
  double get minExtent => 40;

  @override
  double get maxExtent => 44;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
  final List<String> letters = const [
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
        padding: const EdgeInsets.only(top: 3),
        color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => context
                      .read<PostingAdBloc>()
                      .add(PostingAdChooseLetterEvent(letter: letters[index])),
                  child: AzList(
                    isSelected: context.watch<PostingAdBloc>().state.letter ==
                        letters[index],
                    letter: letters[index],
                  ),
                ),
                itemCount: letters.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
            Divider(
              color: Theme.of(context).dividerColor,
            )
          ],
        ),
      );
}
