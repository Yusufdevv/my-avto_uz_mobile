import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReviewSingleCarActions extends StatefulWidget {
  const ReviewSingleCarActions({
    Key? key,
  }) : super(key: key);

  @override
  State<ReviewSingleCarActions> createState() => _ReviewSingleCarActionsState();
}

class _ReviewSingleCarActionsState extends State<ReviewSingleCarActions> {
  bool? isLike;
  bool? isDislike;
  @override
  Widget build(BuildContext context) => Row(
        children: [
          const SizedBox(width: 16),
          WButton(
            onTap: () {
              setState(() {
                isDislike = true;
                isLike = false;
              });
            },
            height: 36,
            width: 36,
            borderRadius: 99,
            border: Border.all(
                color: isDislike == null || !isDislike! ? border : orange,
                width: 1),
            color: white,
            child: SvgPicture.asset(
              AppIcons.dislikeHand,
              color: isDislike == null || !isDislike! ? warmerGrey : orange,
            ),
          ),
          const SizedBox(width: 10),
          WButton(
            onTap: () {
              setState(() {
                isLike = true;
                isDislike = false;
              });
            },
            height: 36,
            width: 36,
            borderRadius: 99,
            border: Border.all(
                color: isLike == null || !isLike! ? border : orange, width: 1),
            color: white,
            child: SvgPicture.asset(
              AppIcons.likeHand,
              color: isLike == null || !isLike! ? warmerGrey : orange,
            ),
          ),
          const Spacer(),
          SvgPicture.asset(AppIcons.messageRectangle),
          const SizedBox(width: 8),
          Text(
            9.toString(),
            style:
                Theme.of(context).textTheme.headline6!.copyWith(fontSize: 14),
          ),
          const VerticalDivider(color: black, thickness: 1, width: 16),
          SvgPicture.asset(AppIcons.eye),
          const SizedBox(width: 8),
          Text(
            276.toString(),
            style:
                Theme.of(context).textTheme.headline6!.copyWith(fontSize: 14),
          ),
          const SizedBox(width: 16),
        ],
      );
}
