import 'package:auto/assets/colors/dark.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RatingBottomsheet extends StatefulWidget {
  const RatingBottomsheet({super.key});

  @override
  State<RatingBottomsheet> createState() => _RatingBottomsheetState();
}

class _RatingBottomsheetState extends State<RatingBottomsheet> {
  double _ratingValue = 0;
  int _currentPage = 0;
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 28),
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context), behavior: HitTestBehavior.opaque,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(AppIcons.chevronLeft),
                  SvgPicture.asset(AppIcons.close),
                ],
              ),
            ),
            const SizedBox(height: 60),
            Expanded(
              flex: 1,
              child: PageView(
                physics: const BouncingScrollPhysics(),
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  Column(
                    children: [
                      Center(
                        child: RatingBar(
                          initialRating: 0,
                          allowHalfRating: false,
                          itemCount: 5,
                          ratingWidget: RatingWidget(
                            full: SvgPicture.asset(AppIcons.star),
                            half: SvgPicture.asset(AppIcons.star),
                            empty: SvgPicture.asset(AppIcons.starr),
                          ),
                          onRatingUpdate: (value) =>
                              setState(() => _ratingValue = value),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Center(
                        child: Text(
                          LocaleKeys.rating_comment.tr(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: DarkThemeColors.dolphinToGreySuit,
                          ),
                        ),
                      ),
                      const SizedBox(height: 72),
                    ],
                  ),
                  const Center(child: Text('Auto2')),
                  const Center(child: Text('Auto3')),
                  const Center(child: Text('Auto4')),
                  const Center(child: Text('Auto5')),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                rateContainer(
                  _currentPage >= 0
                      ? LightThemeColors.headline5
                      : LightThemeColors.solitudeToDarkGray95,
                ),
                rateContainer(
                  _currentPage >= 1
                      ? LightThemeColors.headline5
                      : LightThemeColors.solitudeToDarkGray95,
                ),
                rateContainer(
                  _currentPage >= 2
                      ? LightThemeColors.headline5
                      : LightThemeColors.solitudeToDarkGray95,
                ),
                rateContainer(
                  _currentPage >= 3
                      ? LightThemeColors.headline5
                      : LightThemeColors.solitudeToDarkGray95,
                ),
                rateContainer(
                  _currentPage >= 4
                      ? LightThemeColors.headline5
                      : LightThemeColors.solitudeToDarkGray95,
                ),
              ],
            ),
          ],
        ),
      );
  Widget rateContainer(Color color) => Container(
        margin: const EdgeInsets.only(right: 8),
        height: 4,
        width: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: color,
        ),
      );
}
