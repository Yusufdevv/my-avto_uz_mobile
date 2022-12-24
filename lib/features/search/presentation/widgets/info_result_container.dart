import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_like.dart';
import 'package:auto/features/search/presentation/part/bottom_sheet_for_calling.dart';
import 'package:auto/features/search/presentation/widgets/custom_chip.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoResultContainer extends StatelessWidget {
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
      required this.publishedAt,
      required this.userFullName,
      required this.userImage,
      required this.userType,
      required this.hasComparison,
      required this.callFrom,
      required this.callTo,
      required this.discount,
      this.sellType,
      super.key});
  final List<String> gallery;
  final String contactPhone;
  final String carModelName;
  final int carYear;
  final double price;
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
                  for (int index = 0; index < gallery.length; index++)
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
                          imageUrl: gallery[index],
                          fit: BoxFit.cover,
                          height: 201,
                          width: 264,
                        ),
                      ),
                    ),
                  if (MyFunctions.enableForCalling(
                      callFrom: callFrom, callTo: callTo))
                    WButton(
                      onTap: () {
                        bottomSheetForCalling(context, contactPhone);
                      },
                      height: 201,
                      color: emerald,
                      margin: const EdgeInsets.only(left: 2, right: 16),
                      width: 264,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppIcons.phoneCall),
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
                                  text: '$callFrom - $callTo',
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
                  carModelName,
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: dark),
                ),
                const SizedBox(width: 4),
                CustomChip(
                  label: '$carYear',
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
            if (discount == -1)
              RichText(
                text: TextSpan(
                  text: MyFunctions.getFormatCost('$price'),
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
                      text: MyFunctions.getFormatCost(discount.toString()),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: green,
                      ),
                    ),
                    const WidgetSpan(child: SizedBox(width: 4)),
                    TextSpan(
                      text: MyFunctions.getFormatCost('$price'),
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: grey,
                          ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 8),
            Text(
              description,
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
                  child: CachedNetworkImage(
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        SvgPicture.asset(AppIcons.car),
                    imageUrl: userImage,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 8),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '$userFullName\n',
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(fontSize: 14),
                      ),
                      TextSpan(
                        text: userType,
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
                      '$districtTitle • ${MyFunctions.getAutoPublishDate(publishedAt)}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: SizedBox(
                      height: 28,
                      width: 28,
                      child: WLike(
                        initialLike: hasComparison,
                        activeIcon: SvgPicture.asset(AppIcons.scalesRed),
                        inActiveIcon: SvgPicture.asset(
                          AppIcons.scale,
                          width: 24,
                          height: 24,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    height: 28,
                    width: 28,
                    child: WLike(initialLike: isWishlisted),
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
