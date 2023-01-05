import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class CommercialCarModelItem extends StatelessWidget {
  CommercialCarModelItem({
    required this.title,
    this.centerTitle = false,
    this.subtitle,
    super.key,
    required this.onTap,
    required this.imageUrl,
  });
  bool centerTitle;
  String title;
  String? subtitle;
  TextStyle? titleStyle;
  TextStyle? subtitleStyle;
  final VoidCallback onTap;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemedColors>()!;
    return WButton(
      onTap: onTap,
      color: theme.solitudeToGondola,
      border: Border.all(
        width: 1,
        color: theme.solitudeToPayneGrey,
      ),
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          if (imageUrl.isEmpty)
            SvgPicture.asset(
              AppIcons.vehicle,
              width: 24,
              height: 24,
            )
          else
            CachedNetworkImage(
              imageUrl: imageUrl,
              height: 36,
              width: 36,
              fit: BoxFit.cover,
            ),
          const SizedBox(
            width: 12,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            width: 1,
            height: 20,
            color: theme.solitudeToCharcoal,
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.isEmpty ? LocaleKeys.choose_brand_model.tr() : title,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: 14,
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .midnightExpressToDolphin),
              ),
              if (subtitle!.isNotEmpty)
                Text(
                  subtitle!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff92929D),
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }
}
