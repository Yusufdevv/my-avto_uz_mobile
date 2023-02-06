import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/presentation/widgets/completion_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChooseBrandAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String reverseTitle;

  final Animation<double> scaleAnimation;
  final Animation<double> reversScaleAnimation;
  const ChooseBrandAppBar({
    required this.reverseTitle,
    required this.title,
    required this.scaleAnimation,
    required this.reversScaleAnimation,
  });

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
                        onTap: () {},
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
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
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
                        onTap: () {},
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
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
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
            visibile: true,
            screenWidth: MediaQuery.of(context).size.width,
            totalSteps: 20,
            currentStep: 1,
            progressBarColor: orange,
          ),
        ],
      );
}
