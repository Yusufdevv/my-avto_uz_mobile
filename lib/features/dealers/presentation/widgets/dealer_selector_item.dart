import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DealerSelectorItem extends StatelessWidget {
  final String title;
  final String hintText;
  final String defaultText;
  final VoidCallback onTap;
  final bool isLoading;

  const DealerSelectorItem(
      {required this.onTap,
      required this.title,
      required this.hintText,
      required this.defaultText,
      this.isLoading = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context)
                      .extension<ThemedColors>()!
                      .greySuitToWhite60,
                ),
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
                color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
              ),
              child: isLoading
                  ? const Center(child: CupertinoActivityIndicator())
                  : Row(
                      children: [
                        Expanded(
                          child: Text(
                            hintText.isEmpty ? defaultText : hintText,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: hintText.isEmpty
                                      ? grey
                                      : Theme.of(context)
                                          .extension<ThemedColors>()!
                                          .darkToWhite,
                                ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SvgPicture.asset(
                          AppIcons.chevronDownGrey,
                          color: greyText,
                        )
                      ],
                    ),
            ),
          ),
        ],
      );
}
