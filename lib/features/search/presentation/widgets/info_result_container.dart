import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/bloc/comparison_add/bloc/comparison_add_bloc.dart';
import 'package:auto/features/common/bloc/wishlist_add/wishlist_add_bloc.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/search/presentation/part/bottom_sheet_for_calling.dart';
import 'package:auto/features/search/presentation/widgets/add_comparison_item.dart';
import 'package:auto/features/search/presentation/widgets/add_wishlist_item.dart';
import 'package:auto/features/search/presentation/widgets/custom_chip.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoResultContainer extends StatefulWidget {
  const InfoResultContainer(
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
      this.onTap,
      this.sellType,
      super.key});

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
  final String? sellType;
  final Function()? onTap;
  final int index;

  @override
  State<InfoResultContainer> createState() => _InfoResultContainerState();
}

class _InfoResultContainerState extends State<InfoResultContainer> {
  bool isLiked = false;

  @override
  void initState() {
    isLiked = widget.isWishlisted;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 12, left: 16, bottom: 12),
        decoration: BoxDecoration(
            color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
            boxShadow: [
              BoxShadow(
                color: LightThemeColors.subTitle1.withOpacity(0.1),
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
                  for (int index = 0; index < widget.gallery.length; index++)
                    SizedBox(
                      height: 201,
                      width: 264,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
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
                  if (MyFunctions.enableForCalling(
                      callFrom: widget.callFrom, callTo: widget.callTo))
                    WButton(
                      onTap: () {
                        bottomSheetForCalling(context, widget.contactPhone);
                      },
                      height: 201,
                      borderRadius: 0,
                      color: emerald,
                      margin: const EdgeInsets.only(left: 2, right: 16),
                      width: 264,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppIcons.phone),
                          Text(
                            'Позвонить',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(fontSize: 24),
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
                      margin: const EdgeInsets.only(left: 2, right: 16),
                      width: 264,
                      borderRadius: 0,
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
                                  text: 'Звонок не доступен\n',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                TextSpan(
                                  text: 'Просим вас звонить в течении:\n',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2!
                                      .copyWith(color: greyText),
                                ),
                                TextSpan(
                                  text: '${widget.callFrom} - ${widget.callTo}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2!
                                      .copyWith(color: secondary),
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
            if (widget.sellType != null)
              CustomChip(
                label: widget.sellType!,
                backgroundColor: Theme.of(context)
                    .extension<ThemedColors>()!
                    .seashellToCinnabar15,
                labelPadding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                margin: const EdgeInsets.only(top: 8, bottom: 12),
                labelStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: orange,
                      fontSize: 12,
                    ),
              ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  widget.carModelName,
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: dark),
                ),
                const SizedBox(width: 4),
                CustomChip(
                  label: '${widget.carYear}',
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
                if (widget.isNew)
                  CustomChip(
                    leading: SvgPicture.asset(AppIcons.checkCurly),
                    label: 'Новый',
                    backgroundColor: green.withOpacity(0.1),
                    borderRadius: 4,
                    labelStyle: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: green,
                    ),
                  )
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  widget.discount > 0.0
                      ? '${widget.discount.floor()} ${widget.currency.toUpperCase()}'
                      : '${widget.price.floor()} ${widget.currency.toUpperCase()}',
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: green, fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 4),
                if (widget.discount > 0.0)
                  Text(
                    '${widget.price.floor()} ${widget.currency.toUpperCase()}',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                        decoration: TextDecoration.lineThrough, color: grey),
                  )
              ],
            ),
            const SizedBox(height: 8),
            Text(
              widget.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    fontSize: 13,
                    color: grey,
                  ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                CachedNetworkImage(
                  imageBuilder: (context, imageProvider) => Container(
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    padding: const EdgeInsets.all(8),
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      color: warmerGrey,
                      border: Border.all(
                        color: dividerColor,
                        width: 1,
                      ),
                    ),
                    child: SvgPicture.asset(AppIcons.userAvatar),
                  ),
                  imageUrl: widget.userImage,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 8),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${widget.userFullName}\n',
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(fontSize: 14),
                      ),
                      TextSpan(
                        text: widget.userType,
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
                height: 32,
                thickness: 1),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      '${widget.districtTitle} • ${MyFunctions.getAutoPublishDate(widget.publishedAt)}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: AddComparisonItem(
                      id: widget.id,
                      initialLike: widget.hasComparison,
                      bloc: BlocProvider.of<ComparisonAddBloc>(context),
                    ),
                  ),
                  const SizedBox(width: 8),
                  AddWishlistItem(
                    onTap: () {
                      if (!isLiked) {
                        context
                            .read<WishlistAddBloc>()
                            .add(WishlistAddEvent.addWishlist(widget.id, widget.index));
                        isLiked = true;
                      } else {
                        context.read<WishlistAddBloc>().add(
                            WishlistAddEvent.removeWishlist(widget.id,
                                '/users/wishlist/announcement/remove/'));
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
      );
}
