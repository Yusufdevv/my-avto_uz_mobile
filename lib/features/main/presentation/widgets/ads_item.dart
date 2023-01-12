import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/car_single/presentation/car_single_screen.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/search/presentation/widgets/add_wishlist_item.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AdsItem extends StatelessWidget {
  final int id;
  final String name;
  final String image;
  final String price;
  final String location;
  final String description;
  final String currency;
  final bool isLiked;
  final VoidCallback onTapLike;

  const AdsItem({
    required this.id,
    required this.name,
    required this.price,
    required this.location,
    required this.description,
    required this.image,
    required this.currency,
    required this.isLiked,
    required this.onTapLike,
    Key? key,
  }) : super(key: key);

  @override
  // ignore: prefer_expression_function_bodies
  Widget build(BuildContext context) {
    // print('object ${adsEntity.imageUrl}');
    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true)
            .push(fade(page:  CarSingleScreen(id: id,)));
      },
      child: Container(
        height: 269,
        width: 225,
        padding: const EdgeInsets.only(right: 4),
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
            SizedBox(
              height: 126,
              width: 225,
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => Image.asset(
                      AppImages.defaultPhoto,
                      fit: BoxFit.cover,
                    ),
                  )),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                name,
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(fontWeight: FontWeight.w600, fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '${MyFunctions.getFormatCost(price)} $currency',
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    ?.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Theme.of(context)
                        .extension<ThemedColors>()
                        ?.greySuitToWhite60),
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
                        location,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 12,
                            color: Theme.of(context)
                                .extension<ThemedColors>()!
                                .dolphinToGreySuit),
                      )
                    ],
                  ),
                  const Spacer(),
                  AddWishlistItem(
                    onTap: onTapLike,
                    initialLike: isLiked,
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
