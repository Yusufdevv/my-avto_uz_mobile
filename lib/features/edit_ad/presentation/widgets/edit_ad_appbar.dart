import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/widgets/completion_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditAdAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onTapBack;
  final VoidCallback onTapCancel;
  final String title;
  final TextStyle? titleStyle;
  final int currentTabIndex;

  ///Default is 20
  final double backButtonSize;
  final int tabLength;

  const EditAdAppBar({
    required this.onTapCancel,
    required this.currentTabIndex,
    required this.tabLength,
    required this.title,
    required this.onTapBack,
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
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 8),
                  blurRadius: 11,
                  color: dark.withOpacity(0.04),
                ),
              ],
              color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
            ),
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
                          title.length > 25
                              ? '${title.substring(0, 24)}..'
                              : title,
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
          CompletionBar(
            visibile: true,
            screenWidth: MediaQuery.of(context).size.width,
            totalSteps: tabLength,
            currentStep: currentTabIndex + 1,
            progressBarColor: orange,
          ),
        ],
      );
}
