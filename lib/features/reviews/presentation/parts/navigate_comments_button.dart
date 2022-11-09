import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';

class NavigateCommentsButton extends StatelessWidget {
  const NavigateCommentsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: white,
        padding: const EdgeInsets.all(16),
        width: double.maxFinite,
        child: WScaleAnimation(
          child: Text(
            'Комментарии (38)',
            style: Theme.of(context).textTheme.subtitle1!.copyWith(color: blue),
          ),
          onTap: () {},
        ),
      );
}
