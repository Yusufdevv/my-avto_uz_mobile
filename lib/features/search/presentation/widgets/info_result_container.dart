import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_like.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/search/presentation/widgets/custom_chip.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoResultContainer extends StatelessWidget {
  const InfoResultContainer(
      {required this.callFunction,
      this.year,
      this.avatarPicture,
      this.carModel,
      this.subtitle,
      this.owner,
      this.ownerType,
      this.location,
      this.publishTime,
      this.price,
      this.discountPrice,
      this.sellType,
      this.isNew = false,
      this.images = const [],
      this.isWishlist = false,
      super.key});
  final VoidCallback callFunction;
  final String? avatarPicture;
  final int? year;
  final bool isWishlist;
  final String? carModel;
  final String? subtitle;
  final String? owner;
  final String? ownerType;
  final String? location;
  final String? publishTime;
  final String? price;
  final String? discountPrice;
  final String? sellType;
  final bool isNew;
  final List<String> images;
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
              child: PageView.builder(
                pageSnapping: false,
                itemCount: images.isEmpty ? 1 : images.length,
                padEnds: false,
                clipBehavior: Clip.antiAlias,
                controller: PageController(viewportFraction: 0.65),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Stack(
                  children: [
                    if (index == images.length - 1 || images.isEmpty)
                      WScaleAnimation(
                        onTap: callFunction,
                        child: Container(
                          height: 201,
                          color: green,
                          margin: const EdgeInsets.only(left: 2, right: 16),
                          width: 264,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppIcons.phone, color: white),
                              Text(
                                'Позвонить',
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
                      SizedBox(
                        height: 201,
                        width: 264,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: CachedNetworkImage(
                            placeholder: (context, url) => Image.asset(
                              AppImages.carPlaceHolder,
                              fit: BoxFit.cover,
                            ),
                            imageUrl: images[index],
                            fit: BoxFit.cover,
                            height: 201,
                            width: 264,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            CustomChip(
              label: sellType ?? '',
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
            Row(
              children: [
                Text(
                  carModel ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: dark),
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
                if (isNew)
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
                else
                  const SizedBox(),
              ],
            ),
            if (discountPrice == null)
              RichText(
                text: TextSpan(
                  text: MyFunctions.getFormatCost(price!),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .darkToWhite,
                  ),
                ),
              )
            else
              RichText(
                text: TextSpan(
                
                  children: [
                    TextSpan(
                      text: MyFunctions.getFormatCost(discountPrice!),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: green,
                      ),
                    ),
                    const WidgetSpan(child: SizedBox(width: 4)),
                    TextSpan(
                      text: MyFunctions.getFormatCost(price!),
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: grey,
                          ),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 8),
            Text(
              subtitle ?? '',
              style: Theme.of(context).textTheme.headline2!.copyWith(
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
                    borderRadius: BorderRadius.circular(150),
                    child: CachedNetworkImage(
                      placeholder: (context, url) =>
                          SvgPicture.asset(AppIcons.car),
                      imageUrl: avatarPicture!,
                      fit: BoxFit.cover,
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
                        text: ownerType,
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
                children: [
                  FittedBox(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text('$location • $publishTime',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: grey)),
                    ),
                  ),
                  const Spacer(),
                  WButton(
                    onTap: () {},
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
                  WLike(initialLike: isWishlist),
                ],
              ),
            )
          ],
        ),
      );
}
