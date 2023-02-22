import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AboutCarPriceBottom extends StatelessWidget {
  const AboutCarPriceBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(top: 16),
        decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    LocaleKeys.how_the_average_price_is_calculated
                        .tr(namedArgs: {'middle': '\n'}),
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    behavior: HitTestBehavior.opaque,
                    child: SizedBox(
                      width: 32,
                      height: 32,
                      child: SvgPicture.asset(
                        AppIcons.close,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 16, top: 16),
              child: Divider(
                height: 1,
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: LocaleKeys.we_compared_all_parameters.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: dark, fontSize: 16),
                  ),
                  TextSpan(
                    text: 'auto.uz ',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: orange, fontSize: 16),
                  ),
                  TextSpan(
                    text: LocaleKeys.by_parameters.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: dark, fontSize: 16),
                  ),
                ]))),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffF6F6F6),
                borderRadius: BorderRadius.circular(8),
              ),
              margin: const EdgeInsets.only(
                  top: 8, bottom: 16, left: 16, right: 16),
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.ellip),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            LocaleKeys.year_of_issue.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: dark),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.ellip),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            LocaleKeys.Mileage.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: dark),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.ellip),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            LocaleKeys.position.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: dark),
                          )
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.ellip),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            LocaleKeys.brand.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: dark),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.ellip),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            LocaleKeys.model.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: dark),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.ellip),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            LocaleKeys.paint_condition.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: dark),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 28,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
