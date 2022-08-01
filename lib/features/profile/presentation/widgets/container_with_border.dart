import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContainerWithBorder extends StatelessWidget {
  final EdgeInsets margin;
  final String icons;
  final String title;
  final VoidCallback onTap;
  final bool hasAlert;
  final int count;
  final int? countItem;
  final String? language;
  const ContainerWithBorder({
    Key? key,
    this.margin = EdgeInsets.zero,
    this.icons = '',
    required this.title,
    required this.onTap,
    this.hasAlert = false,
    this.count = 1,
    this.countItem,
    this.language,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: margin,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: border),
        ),
        // height: 500,
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            color: border,
            height: 1,
            //width: double.infinity,
          ),
          itemCount: count,
          itemBuilder: (context, index) => WScaleAnimation(
            onTap: onTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(icons),
                    const SizedBox(width: 8),
                    Column(
                      children: [
                        Text(
                          title,
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    if (hasAlert)
                      Container(
                        margin: const EdgeInsets.only(bottom: 18, left: 4),
                        height: 16,
                        width: 16,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: iconBackground.withOpacity(.1)),
                        child: Center(
                          child: SvgPicture.asset(AppIcons.alert),
                        ),
                      )
                    else
                      const SizedBox(),
                    const Spacer(),
                    Text(
                      countItem == null ? '' : countItem.toString(),
                      style: const TextStyle(color: purple),
                    ),
                    Text(
                      language == null ? '' : language.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(width: 10),
                    SvgPicture.asset(
                      AppIcons.chevronRight,
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .darkGreyToWhite,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
