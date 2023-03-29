import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoaderBox extends StatelessWidget {
  final String title;
  final String hintText;
  final VoidCallback onTap;
  final bool isLoading;
  final bool isActive;
  const LoaderBox(
      {required this.onTap,
      required this.title,
      required this.isActive,
      required this.hintText,
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
                fontWeight: FontWeight.w600,
                color: Theme.of(context)
                    .extension<ThemedColors>()!
                    .greyToCinnabar),
          ),
          const SizedBox(height: 8),
          WScaleAnimation(
            onTap: isLoading ? () {} : onTap,
            child: Container(
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
                    .whiteToDark,
              ),
              child: isLoading
                  ? const Center(child: CupertinoActivityIndicator())
                  : Row(
                      children: [
                        Text(
                          hintText,
                          style: isActive
                              ? Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                      fontSize: 14, fontWeight: FontWeight.w600)
                              : Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context)
                                          .extension<ThemedColors>()!
                                          .greyToCinnabar),
                        ),
                        const Spacer(),
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
