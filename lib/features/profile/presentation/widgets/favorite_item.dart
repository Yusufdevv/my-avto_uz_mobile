import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/car_single/presentation/car_single_screen.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/bloc/user_wishlists_notifications/user_wishlists_notification_bloc.dart';
import 'package:auto/features/profile/presentation/widgets/car_name_year_widget.dart';
import 'package:auto/features/search/presentation/part/bottom_sheet_for_calling.dart';
import 'package:auto/features/search/presentation/widgets/add_comparison_item.dart';
import 'package:auto/features/search/presentation/widgets/add_wishlist_item.dart';
import 'package:auto/features/search/presentation/widgets/custom_chip.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoriteItem extends StatefulWidget {
  const FavoriteItem(
      {required this.gallery,
      required this.carModelName,
      required this.carYear,
      required this.contactPhone,
      required this.description,
      required this.districtTitle,
      required this.isNew,
      required this.isWishlisted,
      required this.price,
      required this.currency,
      required this.publishedAt,
      required this.userFullName,
      required this.userImage,
      required this.userType,
      required this.hasComparison,
      required this.callFrom,
      required this.callTo,
      required this.discount,
      required this.id,
      required this.index,
      required this.animation,
      required this.bloc,
      required this.sellType,
      this.onTap,
      super.key});
  final UserWishListsBloc bloc;
  final List<String> gallery;
  final String contactPhone;
  final String carModelName;
  final int carYear;
  final int id;
  final double price;
  final String currency;
  final bool isNew;
  final String description;
  final String userImage;
  final String userFullName;
  final String userType;
  final String districtTitle;
  final String publishedAt;
  final bool isWishlisted;
  final bool hasComparison;
  final double discount;
  final String callFrom;
  final String callTo;
  final String sellType;
  final Function()? onTap;
  final Animation<double> animation;
  final int index;

  @override
  State<FavoriteItem> createState() => _FavoriteItemState();
}

class _FavoriteItemState extends State<FavoriteItem> {
  bool isLiked = false;

  @override
  void initState() {
    isLiked = widget.isWishlisted;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SlideTransition(
        key: ValueKey(widget.id),
        position: Tween(begin: const Offset(-1, 0), end: Offset.zero).animate(
            CurvedAnimation(parent: widget.animation, curve: Curves.easeInOut)),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(fade(page: CarSingleScreen(id: widget.id)))
                .then((value) => widget.bloc.add(GetUserFavoritesEvent()));
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 12, left: 16, bottom: 8),
            decoration: BoxDecoration(
                color: Theme.of(context).extension<ThemedColors>()?.whiteToDark,
                boxShadow: [
                  BoxShadow(
                    color: LightThemeColors.titleMedium.withOpacity(0.1),
                    offset: const Offset(0, 4),
                    blurRadius: 16,
                  ),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 201,
                  child: PageView(
                    pageSnapping: false,
                    padEnds: false,
                    clipBehavior: Clip.antiAlias,
                    controller: PageController(viewportFraction: 0.65),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      for (int index = 0;
                          index < widget.gallery.length;
                          index++)
                        SizedBox(
                          height: 201,
                          width: 264,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: CachedNetworkImage(
                              errorWidget: (context, url, error) => Image.asset(
                                AppImages.carPlaceHolder,
                                fit: BoxFit.cover,
                              ),
                              imageUrl: widget.gallery[index],
                              fit: BoxFit.cover,
                              height: 201,
                              width: 264,
                            ),
                          ),
                        ),
                      if (widget.gallery.isEmpty)
                        SizedBox(
                          height: 201,
                          width: 264,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Image.asset(
                              AppImages.carPlaceHolder,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      if (MyFunctions.enableForCalling(
                          callFrom: widget.callFrom, callTo: widget.callTo))
                        WButton(
                          onTap: () {
                            bottomSheetForCalling(context, widget.contactPhone);
                          },
                          height: 201,
                          borderRadius: 0,
                          color: emerald,
                          margin: const EdgeInsets.only(right: 16),
                          width: 264,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppIcons.phone),
                              Text(
                                LocaleKeys.call.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(fontSize: 24),
                              )
                            ],
                          ),
                        )
                      else
                        WButton(
                          disabledColor: border,
                          isDisabled: true,
                          onTap: () {},
                          height: 201,
                          color: border,
                          width: 264,
                          borderRadius: 0,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(AppIcons.phoneWithClock,
                                  width: 50, height: 50),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: LocaleKeys.call_not_available.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.w600),
                                    ),
                                    TextSpan(
                                      text: LocaleKeys.please_call_during.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(color: greyText),
                                    ),
                                    if (widget.callFrom.length > 4)
                                      TextSpan(
                                        text:
                                            '${widget.callFrom.substring(0, 5)} - ${widget.callTo.substring(0, 5)}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(color: secondary),
                                      ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        )
                    ],
                  ),
                ),
                if (widget.sellType.isNotEmpty)
                  CustomChip(
                    label: widget.sellType,
                    backgroundColor: Theme.of(context)
                        .extension<ThemedColors>()!
                        .seashellToCinnabar15,
                    labelPadding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    margin: const EdgeInsets.only(top: 8),
                    labelStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: orange,
                              fontSize: 12,
                            ),
                    borderRadius: 4,
                  ),
                const SizedBox(height: 12),
                CarNameYearWidget(
                    carName: widget.carModelName,
                    carYear: widget.carYear.toString(),
                    isNew: widget.isNew),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      widget.discount > 0.0
                          ? '${(widget.price - widget.discount).floor()} ${widget.currency.toUpperCase()}'
                          : '${widget.price.floor()} ${widget.currency.toUpperCase()}',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: green, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: 4),
                    if (widget.discount > 0.0)
                      Text(
                        '${widget.price.floor()} ${widget.currency.toUpperCase()}',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                decoration: TextDecoration.lineThrough,
                                color: grey),
                      )
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  widget.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 13,
                        color: grey,
                      ),
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
                          imageUrl: widget.userImage,
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
                            widget.userFullName,
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
                                widget.userType == 'owner'
                                    ? LocaleKeys.private_person.tr()
                                    : LocaleKeys.autosalon.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: purple),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Divider(
                    color: Theme.of(context)
                        .extension<ThemedColors>()
                        ?.solitude2ToNightRider,
                    height: 1,
                    thickness: 1),
                Padding(
                  padding: const EdgeInsets.only(right: 16, top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          '${widget.districtTitle} • ${MyFunctions.getAutoPublishDate(widget.publishedAt)}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: grey),
                        ),
                      ),
                      AddComparisonItem(
                        id: widget.id,
                        initialLike: widget.hasComparison,
                      ),
                      const SizedBox(width: 8),
                      AddWishlistItem(
                        onTap: widget.onTap ?? () {},
                        initialLike: isLiked,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
