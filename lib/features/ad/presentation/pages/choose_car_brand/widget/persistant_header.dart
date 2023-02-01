import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/utils/my_functions.dart';
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

  final List<String> letters = MyFunctions.getUpperLetter();

  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      Container(
        padding: const EdgeInsets.only(top: 3),
        decoration: BoxDecoration(
            // color: Colors.amber,
            color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
            border: Border(
                bottom: BorderSide(
                    color: Theme.of(context).dividerColor, width: 1))),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) => GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => context
                .read<PostingAdBloc>()
                .add(PostingAdChooseEvent(letter: letters[index])),
            child: Container(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 4),
              child: Text(
                letters[index],
                style: letters[index] ==
                        context.watch<PostingAdBloc>().state.letter
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
          ),
          itemCount: letters.length,
          shrinkWrap: false,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(width: 16),
        ),
      );
}
