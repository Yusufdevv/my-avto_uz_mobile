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

class InfoContainer extends StatefulWidget {
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
  State<InfoContainer> createState() => _InfoContainerState();
}

class _InfoContainerState extends State<InfoContainer> {
  bool isLiked = false;

  @override
  void initState() {
    isLiked = widget.initialLike!;
    super.initState();
  }

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
                itemCount: widget.gallery!.length + 1,
                padEnds: false,
                clipBehavior: Clip.antiAlias,
                controller: PageController(viewportFraction: 0.75),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => index == widget.gallery!.length
                    ? WScaleAnimation(
                        onTap: () {
                          bottomSheetForCalling(
                            context,
                            widget.phone ?? '',
                          );
                        },
                        child: Container(
                          height: 201,
                          decoration: BoxDecoration(
                            color: widget.ownerType == 'owner'
                                ? widget.hasCallCard
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
                                  widget.ownerType == 'owner'
                                      ? AppIcons.phone
                                      : AppIcons.shopping,
                                  color: white),
                              Text(
                                widget.ownerType == 'owner'
                                    ? LocaleKeys.call.tr()
                                    : LocaleKeys.buy.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
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
                          imageUrl: widget.gallery?[index] ?? '',
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) => Image.asset(
                            AppImages.defaultPhoto,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ),
            ),
            if (widget.sellType!.isNotEmpty)
              CustomChip(
                label: widget.sellType!,
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
            CarNameYearWidget(
                carName: widget.carModel ?? '',
                carYear: '${widget.year}',
                isNew: widget.hasStatusInfo),
            const SizedBox(height: 4),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: widget.discountPrice!.isEmpty
                        ? '${widget.price} ${widget.currency!.toUpperCase()}'
                        : '${widget.discountPrice!} ${widget.currency!.toUpperCase()}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: widget.hasDiscount
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
                      visible: widget.hasDiscount,
                      child: Text(
                        widget.discountPrice == null ? '' : widget.price!,
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
              widget.subtitle ?? '',
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
                      imageUrl: widget.avatarPicture!,
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
                        '${widget.owner}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.ownerType == 'owner'
                                ? LocaleKeys.private_person.tr()
                                : LocaleKeys.autosalon.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: purple),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (widget.isFromComparison)
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Text(
                                '${widget.location} • ${widget.publishTime}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
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
            if (widget.isFromComparison)
              Padding(
                padding: const EdgeInsets.only(bottom: 4, right: 16),
                child: ButtonAddToComparison(
                    isAddedToComparison: widget.initialComparsions,
                    id: widget.id),
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
                          '${widget.location} • ${widget.publishTime}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: grey),
                        ),
                        const Spacer(),
                        AddComparisonItem(
                          id: widget.id,
                          initialLike: widget.initialComparsions,
                        ),
                        const SizedBox(width: 8),
                        AddWishlistItem(
                          onTap: () {
                            if (!isLiked) {
                              context.read<WishlistAddBloc>().add(
                                  WishlistAddEvent.addWishlist(
                                      widget.id, widget.index));
                              isLiked = true;
                            } else {
                              context.read<WishlistAddBloc>().add(
                                  WishlistAddEvent.removeWishlist(
                                      widget.id, widget.index));
                              isLiked = false;
                            }
                            setState(() {});
                          },
                          initialLike: isLiked,
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
