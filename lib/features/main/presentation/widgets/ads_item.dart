import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/car_single/presentation/car_single_screen.dart';
import 'package:auto/features/common/widgets/w_like.dart';
import 'package:auto/features/main/domain/entities/ads_entity.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AdsItem extends StatelessWidget {
  final AdsEntity adsEntity;

  const AdsItem({required this.adsEntity, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('object ${adsEntity.imageUrl}');
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, fade(page: CarSingleScreen(adsEntity: adsEntity)));
      },
      child: Container(
        width: 225,
        margin: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 19,
              spreadRadius: 0,
              offset: const Offset(0, 4),
              color: dark.withOpacity(.04),
            ),
          ],
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).extension<ThemedColors>()!.whiteToSecondNero,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CachedNetworkImage(
            //   imageUrl: adsEntity.imageUrl.first,
            //   errorWidget: (context, url, error) => Image.asset(
            //     AppImages.defaultPhoto,
            //     fit: BoxFit.cover,
            //   ),
            //   imageBuilder: (context, imageProvider) => Container(
            //     decoration: BoxDecoration(
            //       image: DecorationImage(
            //         image: imageProvider,
            //         fit: BoxFit.cover,
            //         colorFilter: const ColorFilter.mode(
            //           Colors.red,
            //           BlendMode.colorBurn,
            //         ),
            //       ),
            //     ),
            //   ),
            //   placeholder: (context, url) => const CircularProgressIndicator(),
            //   // errorWidget: (context, url, error) => const Icon(Icons.error),
            // ),
            SizedBox(
              height: 126,
              width: 225,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                ),
                child:
                    // adsEntity.imageUrl.first != ''
                    //     ? Image.network(
                    //         adsEntity.imageUrl.first.toString(),
                    //         fit: BoxFit.cover,
                    //       )
                    //     :
                    Image.asset(
                  AppImages.defaultPhoto,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                adsEntity.model,
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
                adsEntity.description,
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
                        adsEntity.region,
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
                      const WLike(),
                      const SizedBox(width: 12),
                      SvgPicture.asset(AppIcons.scale),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
