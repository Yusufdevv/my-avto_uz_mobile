import 'dart:ui';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/commercial/presentation/widgets/custom_chip.dart';
import 'package:auto/features/common/bloc/wishlist_add/wishlist_add_bloc.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/search/presentation/widgets/add_wishlist_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({
    this.year,
    this.avatarPicture,
    this.hasDiscount = true,
    this.carModel,
    this.subtitle,
    this.owner,
    this.ownerType,
    this.location,
    this.publishTime,
    this.price,
    this.discountPrice,
    this.sellType,
    this.hasStatusInfo = true,
    this.hasCallCard = true,
    required this.onTapComparsion,
    required this.onTapFavorites,
    super.key,
    this.currency,
    this.gallery,
    this.initialLike,
    this.id,
    this.bloc,
  });

  final String? avatarPicture;
  final bool hasDiscount;
  final int? year;
  final String? carModel;
  final String? subtitle;
  final String? owner;
  final String? ownerType;
  final String? location;
  final String? publishTime;
  final String? price;
  final String? discountPrice;
  final String? sellType;
  final String? currency;
  final List<String>? gallery;
  final bool hasStatusInfo;
  final bool hasCallCard;
  final VoidCallback onTapComparsion;
  final VoidCallback onTapFavorites;
  final bool? initialLike;
  final WishlistAddBloc? bloc;
  final int? id;

  @override
  Widget build(BuildContext context) {
    print('Bu Galary' + gallery.toString());
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(top: 12, left: 16, bottom: 12),
      decoration: BoxDecoration(
          color: Theme.of(context).extension<ThemedColors>()!.whiteToDark),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 201,
            child: PageView.builder(
              pageSnapping: false,
              itemCount: gallery!.length + 1,
              padEnds: false,
              clipBehavior: Clip.antiAlias,
              controller: PageController(viewportFraction: 0.75),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Stack(
                children: [
                  if (index == gallery!.length)
                    WScaleAnimation(
                      onTap: () {},
                      child: Container(
                        height: 201,
                        decoration: BoxDecoration(
                          color: hasCallCard ? green : red,
                          borderRadius: BorderRadius.only(
                              topRight: const Radius.circular(8),
                              bottomRight: const Radius.circular(8),
                              topLeft: Radius.circular(index == 0 ? 8 : 0),
                              bottomLeft: Radius.circular(index == 0 ? 8 : 0)),
                        ),
                        margin: const EdgeInsets.only(left: 2, right: 16),
                        width: 264,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                                hasCallCard
                                    ? AppIcons.phone
                                    : AppIcons.shopping,
                                color: white),
                            Text(
                              hasCallCard ? 'Позвонить' : 'Купить',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(fontSize: 24),
                            )
                          ],
                        ),
                      ),
                    )
                  else
                    Container(
                      height: 201,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: index == 0
                              ? const Radius.circular(8)
                              : Radius.zero,
                          bottomLeft: index == 0
                              ? const Radius.circular(8)
                              : Radius.zero,
                        ),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      child: CachedNetworkImage(
                        imageUrl: gallery![index],
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => Image.asset(
                          AppImages.defaultPhoto,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (sellType!.isNotEmpty)
            CustomChip(
              label: sellType!,
              backgroundColor: Theme.of(context)
                  .extension<ThemedColors>()!
                  .seashellToCinnabar15,
              labelPadding:
                  const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              margin: const EdgeInsets.only(top: 8),
              labelStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: orange,
                    fontSize: 12,
                  ),
              borderRadius: 4,
            ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                carModel ?? '',
                style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: dark, fontSize: 14, fontWeight: FontWeight.w400),
              ),
              const SizedBox(width: 4),
              CustomChip(
                label: '$year',
                backgroundColor:
                    LightThemeColors.navBarIndicator.withOpacity(0.1),
                borderRadius: 4,
                labelStyle: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: LightThemeColors.navBarIndicator,
                ),
              ),
              const SizedBox(width: 4),
              CustomChip(
                leading: SvgPicture.asset(AppIcons.checkCurly),
                label: 'Новый',
                backgroundColor: emerald.withOpacity(0.1),
                borderRadius: 4,
                labelStyle: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: emerald,
                ),
              )
            ],
          ),
          const SizedBox(height: 4),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$price ${currency!.toUpperCase()}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: hasDiscount
                        ? green
                        : Theme.of(context)
                            .extension<ThemedColors>()!
                            .darkToWhite,
                  ),
                ),
                const WidgetSpan(child: SizedBox(width: 4)),
                WidgetSpan(
                  child: Visibility(
                    visible: hasDiscount,
                    child: Text(
                      discountPrice ?? '',
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: grey,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle ?? '',
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: 13,
                  color: grey,
                ),
            maxLines: 2,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              SizedBox(
                height: 36,
                width: 36,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: CachedNetworkImage(
                    imageUrl: avatarPicture!,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => Image.asset(
                      AppImages.defaultPhoto,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '$owner\n',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: 14),
                    ),
                    TextSpan(
                      text: ownerType == 'owner' ? 'Частное лицо' : 'Автосалон',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: purple),
                    ),
                  ],
                ),
              )
            ],
          ),
          Divider(
            color: Theme.of(context)
                .extension<ThemedColors>()!
                .solitude2ToNightRider,
            height: 28,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                Text(
                  '$location  •  $publishTime',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: grey),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: WButton(
                    onTap: onTapComparsion,
                    height: 28,
                    width: 28,
                    isDisabled: true,
                    disabledColor: transparentButton,
                    color: transparentButton,
                    child: SvgPicture.asset(
                      AppIcons.scales,
                      color: warmerGrey,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // WButton(
                //   onTap: onTapFavorites,
                //   height: 28,
                //   width: 28,
                //   color: transparentButton,
                //   child: SvgPicture.asset(
                //     AppIcons.heart,
                //     color: warmerGrey,
                //     fit: BoxFit.cover,
                //   ),
                // ),
                AddWishlistItem(bloc: bloc!, id: id!, initialLike: initialLike)
              ],
            ),
          )
        ],
      ),
    );
  }
}
