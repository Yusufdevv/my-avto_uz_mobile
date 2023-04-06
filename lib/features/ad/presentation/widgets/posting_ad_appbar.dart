import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/widgets/completion_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostingAdAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onTapBack;
  final VoidCallback onTapCancel;
  final bool hasCancelButton;
  final String title;
  final TextStyle? titleStyle;
  final bool hasShadow;
  final int currentTabIndex;
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
    required this.hasCancelButton,
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
              color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
              // color: Colors.amber,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                FadeTransition(
                  opacity: reversScaleAnimation,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 48,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: onTapBack,
                                behavior: HitTestBehavior.opaque,
                                child: SizedBox(
                                  width: 24,
                                  height: 30,
                                  child: SvgPicture.asset(
                                    AppIcons.chevronLeft,
                                    height: 26,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  reverseTitle,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                FadeTransition(
                  opacity: scaleAnimation,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 48,
                        child: Row(
                          children: [
                            const SizedBox(width: 16),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: onTapBack,
                              child: SizedBox(
                                width: 24,
                                height: 30,
                                child: SvgPicture.asset(
                                  AppIcons.chevronLeft,
                                  height: 26,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: titleStyle ??
                                  Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context)
                                            .extension<ThemedColors>()!
                                            .greySuitToWhite60,
                                      ),
                            ),
                          ],
                        ),
                      ),
                      if (hasCancelButton)
                        GestureDetector(
                          onTap: onTapCancel,
                          behavior: HitTestBehavior.opaque,
                          child: Container(
                            alignment: Alignment.centerRight,
                            width: 32,
                            height: 32,
                            padding: const EdgeInsets.all(8),
                            child: SvgPicture.asset(
                              AppIcons.cancel,
                              color: grey,
                            ),
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
