import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReviewSingleCarActions extends StatefulWidget {
  const ReviewSingleCarActions({
    required this.viewsCount,
    required this.commentsCount,
    Key? key,
  }) : super(key: key);

  final int viewsCount;
  final int commentsCount;
  @override
  State<ReviewSingleCarActions> createState() => _ReviewSingleCarActionsState();
}

class _ReviewSingleCarActionsState extends State<ReviewSingleCarActions> {
  @override
  Widget build(BuildContext context) => Row(
        children: [
          const Spacer(),
          SvgPicture.asset(AppIcons.messageRectangle),
          const SizedBox(width: 8),
          Text(
            '${widget.commentsCount}',
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 14),
          ),
          const VerticalDivider(color: black, thickness: 1, width: 16),
          SvgPicture.asset(AppIcons.eye),
          const SizedBox(width: 8),
          Text(
            '${widget.viewsCount}',
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 14),
          ),
          const SizedBox(width: 16),
        ],
      );
}
