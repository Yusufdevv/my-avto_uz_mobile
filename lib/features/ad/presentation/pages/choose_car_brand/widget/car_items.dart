import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/hight_light.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChangeCarItems extends StatelessWidget {
  final String name;
  final String imageUrl;
  final bool isSelected;
  final String text;
  final VoidCallback onTap;
  final bool hasBorder;

  const ChangeCarItems(
      {required this.isSelected,
      required this.name,
      required this.imageUrl,
      required this.text,
      required this.onTap,
      this.hasBorder = true,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          height: 54,
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).extension<ThemedColors>()!.snowToNightRider
                : Colors.transparent,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox.shrink(),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 36,
                          width: 36,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: imageUrl.isEmpty
                                ? Image.asset(
                                    AppImages.defaultPhoto,
                                    height: 36,
                                    fit: BoxFit.cover,
                                  )
                                : CachedNetworkImage(
                                    imageUrl: imageUrl,
                                    height: 36,
                                    width: 36,
                                    fit: BoxFit.cover,
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                      AppImages.defaultPhoto,
                                      height: 36,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        HighlightedText(
                          allText: name,
                          highlightedText: text,
                          terms: text.split(' '),
                          highlightColor:
                              LightThemeColors.tangerineYellowToMediumSlateBlue,
                          textStyle: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                          textStyleHighlight: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                    if (isSelected)
                      SvgPicture.asset(
                        AppIcons.check,
                        color: orange,
                        height: 14,
                      ),
                  ],
                ),
              ),
              if (hasBorder) ...{
                Divider(
                  height: 1,
                  color: Theme.of(context).dividerColor,
                  thickness: 1,
                  indent: 16,
                ),
              } else ...{
                const SizedBox()
              },
            ],
          ),
        ),
      );
}
