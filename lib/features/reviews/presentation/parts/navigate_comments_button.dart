import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';

class NavigateCommentsButton extends StatelessWidget {
  const NavigateCommentsButton({
    required this.commentsCount,
    Key? key,
  }) : super(key: key);
  final int commentsCount;
  @override
  Widget build(BuildContext context) => Container(
        color: white,
        padding: const EdgeInsets.all(16),
        width: double.maxFinite,
        child: WScaleAnimation(
          child: Text(
            'Комментарии ($commentsCount)',
            style: Theme.of(context).textTheme.subtitle1!.copyWith(color: blue),
          ),
          onTap: () {},
        ),
      );
}
