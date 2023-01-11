import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostingAdAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onTapBack;
  final String title;
  final TextStyle? titleStyle;
  final List<Widget> extraActions;
  final Color? backgroundColor;
  final Widget? childWithButton;
  final bool hasBackButton;
  final bool hasShadow;

  ///Default is 20
  final double backButtonSize;

  const PostingAdAppBar({
    required this.hasShadow,
    required this.hasBackButton,
    required this.title,
    required this.onTapBack,
    this.backButtonSize = 20,
    this.backgroundColor,
    this.titleStyle,
    this.extraActions = const [],
    this.childWithButton,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(57);

  @override
  Widget build(BuildContext context) => Container(
        height: (52) + MediaQuery.of(context).padding.top,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        decoration: BoxDecoration(
          boxShadow: hasShadow
              ? [
                  BoxShadow(
                    offset: const Offset(0, 8),
                    blurRadius: 11,
                    color: dark.withOpacity(0.04),
                  ),
                ]
              : null,
          color:
              backgroundColor ?? Theme.of(context).appBarTheme.backgroundColor,
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            WScaleAnimation(
              onTap: hasBackButton ? onTapBack : () {},
              child: Row(
                children: [
                  const SizedBox(width: 24),
                  if (hasBackButton) ...{
                    SvgPicture.asset(AppIcons.chevronLeft)
                  },
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const Spacer(),
            ...extraActions
          ],
        ),
      );
}
