import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:auto/features/common/widgets/cached_image.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileData extends StatelessWidget {
  final EdgeInsets margin;
  final String imageUrl;
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  final bool hasAlert;
  const ProfileData(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.subTitle,
      this.hasAlert = true,
      required this.imageUrl,
      this.margin = EdgeInsets.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) => WScaleAnimation(
        onTap: onTap,
        child: Container(
          margin: margin,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Theme.of(context)
                .extension<WTextFieldStyle>()!
                .borderColor),
            color: Theme.of(context).extension<ThemedColors>()!.whiteToNero1,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: CachedImage(
                      fit: BoxFit.cover,
                      height: 48,
                      width: 48,
                      imageUrl: imageUrl,
                      border: Border.all(color: borderCircular),
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        subTitle,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontSize: 14),
                      )
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
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: SvgPicture.asset(
                      AppIcons.chevronRight,
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .darkGreyToWhite,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
}
