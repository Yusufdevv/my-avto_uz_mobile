import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/commercial/presentation/widgets/custom_chip.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
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
    // ignore: always_put_required_named_parameters_first
    required this.onTapComparsion,
    // ignore: always_put_required_named_parameters_first
    required this.onTapFavorites,
    super.key,
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
  final bool hasStatusInfo;
  final bool hasCallCard;
  final VoidCallback onTapComparsion;
  final VoidCallback onTapFavorites;

  @override
  Widget build(BuildContext context) => Container(
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
                itemCount: 5,
                padEnds: false,
                clipBehavior: Clip.antiAlias,
                controller: PageController(viewportFraction: 0.75),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Stack(
                  children: [
                    if (index == 4)
                      WScaleAnimation(
                        onTap: () {},
                        child: Container(
                          height: 201,
                          decoration: BoxDecoration(
                            color: hasCallCard ? green : red,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8)),
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
                          image: const DecorationImage(
                            image: AssetImage(
                                'assets/images/car_single/car_single300kb.png'),
                            fit: BoxFit.cover,
                          ),
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
                margin: const EdgeInsets.only(top: 8, bottom: 12),
                labelStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: orange,
                      fontSize: 12,
                    ),
                borderRadius: 4,
              ),
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
                    text: price,
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
                  TextSpan(
                    text: subtitle ?? '',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontSize: 13,
                          color: grey,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(avatarPicture!),
                  backgroundColor: blue,
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
              height: 28,
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
                  WButton(
                    onTap: onTapFavorites,
                    height: 28,
                    width: 28,
                    color: transparentButton,
                    child: SvgPicture.asset(
                      AppIcons.heart,
                      color: warmerGrey,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
