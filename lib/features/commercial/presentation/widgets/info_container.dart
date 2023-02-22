import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/commercial/presentation/widgets/button_add_to_comparison.dart';
import 'package:auto/features/commercial/presentation/widgets/custom_chip.dart';
import 'package:auto/features/common/bloc/wishlist_add/wishlist_add_bloc.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/profile/presentation/widgets/car_name_year_widget.dart';
import 'package:auto/features/search/presentation/part/bottom_sheet_for_calling.dart';
import 'package:auto/features/search/presentation/widgets/add_comparison_item.dart';
import 'package:auto/features/search/presentation/widgets/add_wishlist_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({
    required this.onTapComparsion,
    required this.onTapFavorites,
    required this.index,
    required this.initialComparsions,
    required this.id,
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
    super.key,
    this.currency,
    this.gallery,
    this.initialLike,
    this.phone,
    this.isFromComparison = false,
  });

  final String? avatarPicture;
  final bool hasDiscount;
  final int? year;
  final int index;
  final String? carModel;
  final String? subtitle;
  final String? owner;
  final String? ownerType;
  final String? location;
  final String? publishTime;
  final String? price;
  final String? discountPrice;
  final String? sellType;
  final String? phone;
  final String? currency;
  final List<String>? gallery;
  final bool hasStatusInfo;
  final bool hasCallCard;
  final VoidCallback onTapComparsion;
  final VoidCallback onTapFavorites;
  final bool? initialLike;
  final bool isFromComparison;
  final bool initialComparsions;
  final int id;

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 12, left: 16, bottom: 8),
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
                itemBuilder: (context, index) => index == gallery!.length
                    ? WScaleAnimation(
                        onTap: () {
                          bottomSheetForCalling(
                            context,
                            phone ?? '',
                          );
                        },
                        child: Container(
                          height: 201,
                          decoration: BoxDecoration(
                            color: ownerType == 'owner'
                                ? hasCallCard
                                    ? green
                                    : red
                                : red,
                          ),
                          margin: const EdgeInsets.only(right: 16),
                          width: 264,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  ownerType == 'owner'
                                      ? AppIcons.phone
                                      : AppIcons.shopping,
                                  color: white),
                              Text(
                                ownerType == 'owner'
                                    ? LocaleKeys.call.tr()
                                    : LocaleKeys.buy.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(fontSize: 24),
                              )
                            ],
                          ),
                        ),
                      )
                    : Container(
                        height: 201,
                        width: 280,
                        padding: const EdgeInsets.only(right: 4),
                        child: CachedNetworkImage(
                          imageUrl: gallery?[index] ?? '',
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) => Image.asset(
                            AppImages.defaultPhoto,
                            fit: BoxFit.cover,
                          ),
                        ),
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
                labelStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: orange,
                      fontSize: 12,
                    ),
                borderRadius: 4,
              ),
            const SizedBox(height: 12),
            CarNameYearWidget(
                carName: carModel ?? '',
                carYear: '$year',
                isNew: hasStatusInfo),
            const SizedBox(height: 4),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: discountPrice!.isEmpty
                        ? '$price ${currency!.toUpperCase()}'
                        : '${discountPrice!} ${currency!.toUpperCase()}',
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
                  const WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: SizedBox(width: 4)),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Visibility(
                      visible: hasDiscount,
                      child: Text(
                        discountPrice == null ? '' : price!,
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
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
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$owner',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ownerType == 'owner'
                                ? LocaleKeys.private_person.tr()
                                : LocaleKeys.autosalon.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: purple),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (isFromComparison)
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Text(
                                '$location • $publishTime',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: grey),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (isFromComparison)
              Padding(
                padding: const EdgeInsets.only(bottom: 4, right: 16),
                child: ButtonAddToComparison(
                    isAddedToComparison: initialComparsions, id: id),
              )
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .solitude2ToNightRider,
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Row(
                      children: [
                        Text(
                          '$location • $publishTime',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: grey),
                        ),
                        const Spacer(),
                        AddComparisonItem(
                          id: id,
                          initialLike: initialComparsions,
                        ),
                        const SizedBox(width: 8),
                        BlocConsumer<WishlistAddBloc, WishlistAddState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            final isLiked =
                                state.map[id] ?? initialLike?? false;
                            return AddWishlistItem(
                              onTap: () {
                                print('ontap info container');
                                if (!isLiked) {
                                  print('addd');
                                  context.read<WishlistAddBloc>().add(
                                      WishlistAddEvent.addWishlist(id, index));
                                  context.read<WishlistAddBloc>().add(
                                      WishlistAddEvent.addToMapFavorites(
                                          id: id, value: true));
                                } else {
                                  print('remove');
                                  context.read<WishlistAddBloc>().add(
                                      WishlistAddEvent.removeWishlist(
                                          id, index));
                                  context.read<WishlistAddBloc>().add(
                                      WishlistAddEvent.addToMapFavorites(
                                          id: id, value: false));
                                }
                              },
                              initialLike: isLiked,
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
          ],
        ),
      );
}
