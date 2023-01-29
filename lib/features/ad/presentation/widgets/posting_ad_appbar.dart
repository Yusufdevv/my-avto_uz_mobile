import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/presentation/widgets/completion_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostingAdAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onTapBack;
  final String title;
  final TextStyle? titleStyle;
  final Widget? childWithButton;
  final bool hasShadow;
  final int currentTabIndex;

  ///Default is 20
  final double backButtonSize;
  final String reverseTitle;
  final int tabLength;
  final Animation<double> scaleAnimation;
  final Animation<double> reversScaleAnimation;
  const PostingAdAppBar({
    required this.currentTabIndex,
    required this.tabLength,
    required this.scaleAnimation,
    required this.reversScaleAnimation,
    required this.reverseTitle,
    required this.hasShadow,
    required this.title,
    required this.onTapBack,
    this.backButtonSize = 20,
    this.titleStyle,
    this.childWithButton,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(57);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
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
              color: white,
            ),
            child: Stack(
              children: [
                FadeTransition(
                  opacity: scaleAnimation,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: onTapBack,
                        child: Row(
                          children: [
                            const SizedBox(width: 16),
                            SvgPicture.asset(
                              AppIcons.chevronLeft,
                              height: 26,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              title.length > 21
                                  ? '${title.substring(0, 20)}..'
                                  : title,
                              style: titleStyle ??
                                  Theme.of(context)
                                      .textTheme
                                      .headline2!
                                      .copyWith(fontWeight: FontWeight.w600),
                            ),
                            childWithButton ?? const SizedBox()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                FadeTransition(
                  opacity: reversScaleAnimation,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: onTapBack,
                        child: Row(
                          children: [
                            const SizedBox(width: 16),
                            SvgPicture.asset(
                              AppIcons.chevronLeft,
                              height: 26,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              reverseTitle.length > 21
                                  ? '${reverseTitle.substring(0, 20)}..'
                                  : reverseTitle,
                              style: titleStyle ??
                                  Theme.of(context)
                                      .textTheme
                                      .headline2!
                                      .copyWith(fontWeight: FontWeight.w600),
                            ),
                            childWithButton ?? const SizedBox()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CompletionBar(
            visibile: hasShadow,
            screenWidth: MediaQuery.of(context).size.width,
            totalSteps: tabLength,
            currentStep: currentTabIndex + 1,
            progressBarColor: orange,
          ),
        ],
      );
}
