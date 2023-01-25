import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileDataWidget extends StatelessWidget {
  final EdgeInsets margin;
  final String imageUrl;
  final String fullName;
  final String subTitle;
  final VoidCallback onTap;
  final bool hasAlert;

  const ProfileDataWidget({
    required this.onTap,
    required this.fullName,
    required this.subTitle,
    required this.imageUrl,
    this.hasAlert = true,
    this.margin = EdgeInsets.zero,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => WScaleAnimation(
        onTap: onTap,
        child: Container(
          margin: margin,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              SizeConfig.h(12),
            ),
            border: Border.all(
                color: Theme.of(context)
                    .extension<WTextFieldStyle>()!
                    .borderColor),
            color: Theme.of(context).extension<ThemedColors>()!.whiteToNero1,
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(SizeConfig.h(12)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    SizeConfig.h(24),
                  ),
                  child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      height: SizeConfig.v(48),
                      width: SizeConfig.h(48),
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => SizedBox(
                          height: SizeConfig.v(48),
                          width: SizeConfig.h(48),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                SizeConfig.h(24),
                              ),
                              child: Image.asset(AppImages.defaultPhoto, fit: BoxFit.cover)))),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(fullName.isEmpty ? 'No name' : fullName,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(fontSize: 18)),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.v(2)),
                    Text(
                      subTitle,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: SizeConfig.h(16),
                ),
                child: SvgPicture.asset(
                  AppIcons.chevronRight1,
                  color: Theme.of(context)
                      .extension<ThemedColors>()!
                      .darkGreyToWhite,
                ),
              ),
            ],
          ),
        ),
      );
}
