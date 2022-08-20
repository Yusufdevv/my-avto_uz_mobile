import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/main/domain/entities/ads_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AdsItem extends StatelessWidget {
  final AdsEntity adsEntity;
  const AdsItem({required this.adsEntity, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: 225,
        margin: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).extension<ThemedColors>()!.whiteToSecondNero,
          border: Border.all(
            width: 1,
            color: Theme.of(context)
                .extension<ThemedColors>()!
                .solitudeToDarkRider,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: SizedBox(
                  height: 126,
                  child: Image.network(
                    adsEntity.imageUrl,
                    fit: BoxFit.cover,
                  ),
                )),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                adsEntity.carName,
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                adsEntity.price,
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                adsEntity.aboutCar,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .greySuitToWhite60),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 1,
              margin: const EdgeInsets.only(left: 16),
              color: Theme.of(context)
                  .extension<ThemedColors>()!
                  .solitudeToWhite35,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 12, left: 16, bottom: 10),
              child: Row(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.location),
                      const SizedBox(width: 4),
                      Text(
                        adsEntity.place,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 12,
                            color: Theme.of(context)
                                .extension<ThemedColors>()!
                                .dolphinToGreySuit),
                      )
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.heart),
                      const SizedBox(width: 12),
                      SvgPicture.asset(AppIcons.scale),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
}
