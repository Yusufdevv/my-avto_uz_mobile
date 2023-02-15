import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/ad/presentation/pages/map_screen/widgets/point_name_shimmer.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/dealers/domain/entities/map_entity.dart';
import 'package:auto/features/dealers/presentation/pages/dealer_single_page.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/pages/directory/directory_single_page.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
  Widget build(BuildContext context) => WScaleAnimation(
        onTap: () {
          if (currentDealer != null && !isWaiting) {
            isFromDirectoryPage
                ? Navigator.push(
                    context,
                    fade(
                        page: DirectorySinglePage(
                            slug: currentDealer?.slug ?? '')))
                : Navigator.push(
                    context,
                    fade(
                        page:
                            DealerSinglePage(slug: currentDealer?.slug ?? '')));
          }
        },
        child: Column(
          children: [
            if (currentDealer != null && !isWaiting) ...{
              MapItemImageNameWidget(
                  dealerImageUrl: currentDealer?.avatar ?? '',
                  dealerName: currentDealer?.name ?? '',
                  dealerType: currentDealer?.name ?? ''),
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
                        style: Theme.of(context).textTheme.subtitle2!,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),
            },
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(AppIcons.foldedMap, color: greyText),
                const SizedBox(width: 8),
                if (name == null || isWaiting) ...{
                  const PointNameShimmer()
                } else ...{
                  Expanded(
                    child: Text(
                      name ?? '',
                      style: Theme.of(context).textTheme.subtitle2!,
                    ),
                  ),
                }
              ],
            ),
          ],
        ),
      );
}

class MapItemImageNameWidget extends StatelessWidget {
  const MapItemImageNameWidget({
    required this.dealerImageUrl,
    required this.dealerName,
    required this.dealerType,
    Key? key,
  }) : super(key: key);

  final String dealerImageUrl;
  final String dealerName;
  final String dealerType;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: dividerColor)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: CachedNetworkImage(
                  imageUrl: dealerImageUrl,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Image.asset(
                    AppImages.carPlaceHolder,
                    fit: BoxFit.cover,
                  ),
                )),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(dealerName,
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1),
                Text(dealerType,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 12, color: purple),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1)
              ],
            ),
          ),
          const Spacer(),
          SvgPicture.asset(
            AppIcons.chevronRightGrey,
            color: grey,
          ),
        ],
      );
}
