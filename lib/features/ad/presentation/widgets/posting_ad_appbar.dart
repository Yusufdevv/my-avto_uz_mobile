import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/presentation/widgets/completion_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostingAdAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onTapBack;
  final VoidCallback onTapCancel;
  final bool hasBackButton;
  final String title;
  final TextStyle? titleStyle;
  final bool hasShadow;
  final int currentTabIndex;

  ///Default is 20
  final double backButtonSize;
  final String reverseTitle;
  final int tabLength;
  final Animation<double> scaleAnimation;
  final Animation<double> reversScaleAnimation;
  const PostingAdAppBar({
    required this.onTapCancel,
    required this.currentTabIndex,
    required this.tabLength,
    required this.scaleAnimation,
    required this.reversScaleAnimation,
    required this.reverseTitle,
    required this.hasShadow,
    required this.title,
    required this.onTapBack,
    required this.hasBackButton,
    this.backButtonSize = 20,
    this.titleStyle,
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
            child: hasBackButton
                ? Stack(
                    alignment: Alignment.center,
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
                                            .displayMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      FadeTransition(
                        opacity: reversScaleAnimation,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: onTapBack,
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppIcons.chevronLeft,
                                      height: 26,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      reverseTitle.length > 25
                                          ? '${reverseTitle.substring(0, 24)}..'
                                          : reverseTitle,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .copyWith(),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: onTapCancel,
                                behavior: HitTestBehavior.opaque,
                                child: SvgPicture.asset(
                                  AppIcons.cancel,
                                  color: grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
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
