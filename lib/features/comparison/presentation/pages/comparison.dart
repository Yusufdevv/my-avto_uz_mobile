import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/comparison/presentation/pages/comaparison_page2.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


class ComparisonPage extends StatelessWidget {
  const ComparisonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: WAppBar(
          title: LocaleKeys.car_comparison.tr(),
          titleStyle: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .solitude1ToNero),
                    child: Image.asset(AppIcons.carIcon),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      LocaleKeys.add_car_comparison.tr(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .midnightExpressToGreySuit,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: WButton(
                onTap: () {
                  Navigator.push(context,
                      fade(page: const ComparisonPage2(numberOfAddedCars: 2)));
                },
                color: purple,
                text: LocaleKeys.add_advert.tr(),
              ),
            )
          ],
        ),
      );
}
