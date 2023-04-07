import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DirectoryProductBox extends StatelessWidget {
  final String phoneNumber;
  final String name;
  final String image;
  final String price;
  final bool isAgreedPrice;

  const DirectoryProductBox({
    required this.phoneNumber,
    required this.image,
    required this.name,
    required this.isAgreedPrice,
    required this.price,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
          border: Border.all(
              width: 1,
              color: Theme.of(context).extension<ThemedColors>()!.divider),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 96,
              child: Container(
                width: double.maxFinite,
                margin: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.defaultPhoto),
                    fit: BoxFit.cover,
                  ),
                  color: dividerColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8),
                    bottom: Radius.circular(4),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(8),
                    bottom: Radius.circular(4),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Expanded(
              flex: 58,
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    Text(
                      isAgreedPrice
                          ? LocaleKeys.negotiable.tr()
                          : '${MyFunctions.getFormatCost(price)} UZS',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      );
}
