import 'package:auto/assets/colors/color.dart';
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
    required this.onTap,
    required this.onTapClear,
    required this.imageUrl,
    this.centerTitle = false,
    this.subtitle,
    super.key,
  });

  bool centerTitle;
  String title;
  String? subtitle;
  TextStyle? titleStyle;
  TextStyle? subtitleStyle;
  final VoidCallback onTap;
  final VoidCallback onTapClear;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemedColors>()!;
    return WButton(
      onTap: onTap,
      color: theme.whiteToDark,
      border: Border.all(
        width: 1,
        color: theme.solitudeToPayneGrey,
      ),
      height: 51,
      margin: const EdgeInsets.only(top: 16, bottom: 12, right: 16, left: 16),
      child: Row(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(right: 16, top: 8, bottom: 8, left: 12),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              height: 36,
              width: 36,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => SvgPicture.asset(
                AppIcons.vehicle,
                width: 24,
                height: 24,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            width: 1,
            height: 20,
            color: theme.solitudeToCharcoal,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.isEmpty ? LocaleKeys.choose_brand_model.tr() : title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                if (subtitle!.isNotEmpty)
                  Text(
                    subtitle ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(color: darkGray),
                  )
              ],
            ),
          ),
          const Spacer(),
          if (title.isNotEmpty)
            GestureDetector(
              onTap: onTapClear,
              child: Padding(
                padding: const EdgeInsets.only(right: 12, left: 12),
                child: CircleAvatar(
                  backgroundColor: warmerGrey,
                  radius: 10,
                  child: SvgPicture.asset(
                    AppIcons.close,
                    color: white,
                    fit: BoxFit.cover,
                    height: 16,
                    width: 16,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
