import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReviewSingleCarActions extends StatefulWidget {
  ReviewSingleCarActions({
    required this.isLike,
    required this.isDislike,
    required this.viewsCount,
    required this.commentsCount,
    Key? key,
  }) : super(key: key);
  bool? isLike;
  bool? isDislike;
  final int viewsCount;
  final int commentsCount;
  @override
  State<ReviewSingleCarActions> createState() => _ReviewSingleCarActionsState();
}

class _ReviewSingleCarActionsState extends State<ReviewSingleCarActions> {
  @override
  Widget build(BuildContext context) => Row(
        children: [
          const SizedBox(width: 16),
          WButton(
            onTap: () {
              setState(() {
                widget
                  ..isDislike = true
                  ..isLike = false;
              });
            },
            height: 36,
            width: 36,
            borderRadius: 99,
            border: Border.all(color: border, width: 1),
            color: white,
            child: SvgPicture.asset(
              AppIcons.dislikeHand,
              color: widget.isDislike == null || !widget.isDislike!
                  ? warmerGrey
                  : red,
            ),
          ),
          const SizedBox(width: 10),
          WButton(
            onTap: () {
              setState(() {
                widget
                  ..isLike = true
                  ..isDislike = false;
              });
            },
            height: 36,
            width: 36,
            borderRadius: 99,
            border: Border.all(color: border, width: 1),
            color: white,
            child: SvgPicture.asset(
              AppIcons.likeHand,
              color:
                  widget.isLike == null || !widget.isLike! ? warmerGrey : green,
            ),
          ),
          const Spacer(),
          SvgPicture.asset(AppIcons.messageRectangle),
          const SizedBox(width: 8),
          Text(
            '${widget.commentsCount}',
            style:
                Theme.of(context).textTheme.headline6!.copyWith(fontSize: 14),
          ),
          const VerticalDivider(color: black, thickness: 1, width: 16),
          SvgPicture.asset(AppIcons.eye),
          const SizedBox(width: 8),
          Text(
            '${widget.viewsCount}',
            style:
                Theme.of(context).textTheme.headline6!.copyWith(fontSize: 14),
          ),
          const SizedBox(width: 16),
        ],
      );
}
