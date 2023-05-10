import 'dart:developer';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/pages/map_screen/widgets/map_item_image_name_widget.dart';
import 'package:auto/features/ad/presentation/pages/map_screen/widgets/point_name_shimmer.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/dealers/domain/entities/map_entity.dart';
import 'package:auto/features/dealers/presentation/pages/dealer_single_page.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/pages/directory/directory_single_page.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MapPointName extends StatelessWidget {
  final bool isWaiting;
  final String? name;
  final MapEntity? currentDealer;
  final bool isFromDirectoryPage;

  const MapPointName(
      {required this.isWaiting,
      required this.name,
      this.currentDealer,
      this.isFromDirectoryPage = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(':::::::::: fasefasef  ${currentDealer != null && currentDealer?.name != '' && !isWaiting}  ::::::::::');
    log(':::::::::: is waiting:  $isWaiting  ::::::::::');
    log(':::::::::: current dealler:  $currentDealer  ::::::::::');
    return WScaleAnimation(
      onTap: () {
        if (currentDealer != null && !isWaiting) {
          isFromDirectoryPage
              ? Navigator.push(
                  context,
                  fade(
                      page: DirectorySinglePage(
                          categoriesTitle: currentDealer?.category['name'],
                          slug: currentDealer?.slug ?? '')))
              : Navigator.push(
                  context,
                  fade(
                      page: DealerSinglePage(slug: currentDealer?.slug ?? '')));
        }
      },
      child: Column(
        children: [
          if (currentDealer != null &&
              currentDealer?.name != '' &&
              !isWaiting) ...{
            MapItemImageNameWidget(
                dealerImageUrl: currentDealer?.avatar ?? '',
                dealerName: currentDealer?.name ?? '',
                dealerType: isFromDirectoryPage
                    ? (currentDealer?.category as List).isNotEmpty
                        ? (currentDealer?.category as List).first['name']
                        : LocaleKeys.autosalon_autoservice.tr()
                    : currentDealer?.dealerType.name ??
                        LocaleKeys.autosalon.tr()),
            const SizedBox(height: 12),
            Row(
              children: [
                SvgPicture.asset(AppIcons.clockGrey),
                const SizedBox(width: 8),
                if (currentDealer?.contactFrom != null &&
                    currentDealer!.contactFrom.isNotEmpty)
                  Expanded(
                    child: Text(
                      '${LocaleKeys.every_day.tr()}, ${currentDealer?.contactFrom.substring(0, 5)} - ${currentDealer?.contactTo.substring(0, 5)}',
                      maxLines: 4,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .dolphinToGhost),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
          },
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(AppIcons.foldedMap, color: greyText),
              const SizedBox(width: 8),
              if (name == null || isWaiting) ...{
                const PointNameShimmer()
              } else ...{
                Expanded(
                  child: Text(
                    name ?? '',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .dolphinToGhost),
                  ),
                ),
              }
            ],
          ),
        ],
      ),
    );
  }
}
