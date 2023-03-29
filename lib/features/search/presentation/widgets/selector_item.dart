import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectorItem extends StatelessWidget {
  final String title;
  final String hintText;
  final VoidCallback onTap;
  final bool hasArrowDown;
  final bool isLoading;

  const SelectorItem(
      {required this.onTap,
      required this.title,
      required this.hintText,
      this.hasArrowDown = false,
      this.isLoading = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontWeight: FontWeight.w400, color: grey),
          ),
          const SizedBox(height: 8),
          WScaleAnimation(
            onTap: onTap,
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    width: 1,
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .solitudeToDarkRider),
                color: Theme.of(context)
                    .extension<ThemedColors>()!
                    .solitudeContainerToDark,
              ),
              child: isLoading
                  ? const Center(child: CupertinoActivityIndicator())
                  : Row(
                      children: [
                        Expanded(
                          child: Text(
                            hintText,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Theme.of(context)
                                .extension<ThemedColors>()!
                                .darkToWhite),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SvgPicture.asset(
                          hasArrowDown
                              ? AppIcons.chevronDownGrey
                              : AppIcons.chevronRightBlack,
                          color: greyText,
                        )
                      ],
                    ),
            ),
          ),
        ],
      );
}
