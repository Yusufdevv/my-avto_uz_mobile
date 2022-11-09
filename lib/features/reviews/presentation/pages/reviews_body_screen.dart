import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/reviews/presentation/pages/review_single_car_screen.dart';
import 'package:auto/features/reviews/presentation/widgets/review_bottom_sheet_item.dart';
import 'package:auto/features/reviews/presentation/widgets/review_main_container.dart';
import 'package:auto/features/reviews/presentation/widgets/select_model_info.dart';
import 'package:auto/features/reviews/presentation/parts/selected_car_info.dart';
import 'package:auto/features/search/presentation/widgets/sort_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// import 'package:flutter_svg/flutter_svg.dart';

class ReviewsBodyScreen extends StatelessWidget {
  ReviewsBodyScreen({super.key});
  final List<bool> hasDiscount = [true, false];
  final List<String> owner = ['Анвар Гулямов', 'ORIENT MOTORS'];
  final List<String> ownerType = ['Частное лицо', 'Автосалон'];
  final List<String> publishTime = ['Сегодня', '27 февраля'];
  final List<String> sellType = ['Продажа Автомобиля', 'Аренда c выкупом'];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context).extension<ThemedColors>()!;
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.85,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SelectModelInfo(
                        onTap: () {
                          Navigator.push(context,
                              fade(page: const ReviewSingleCarScreen()));
                        },
                        title: 'Марка и модель',
                        centerTitle: true,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WButton(
                            onTap: () {},
                            width: size.width * 0.45,
                            borderRadius: 8,
                            margin: const EdgeInsets.only(left: 16),
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 10),
                            border: Border.all(color: theme.dividerColorToGrey),
                            color: Theme.of(context)
                                .extension<ThemedColors>()!
                                .whiteToDark,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppIcons.filter,
                                  color: orange,
                                  height: 16,
                                  width: 16,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(width: 8),
                                Text('Параметры',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(color: orange)),
                                const Spacer(),
                                CircleAvatar(
                                  backgroundColor: warmerGrey,
                                  radius: 10,
                                  child: SvgPicture.asset(
                                    AppIcons.close,
                                    color: white,
                                    fit: BoxFit.cover,
                                    height: 14,
                                    width: 14,
                                  ),
                                )
                              ],
                            ),
                          ),
                          WButton(
                            onTap: () {},
                            width: size.width * 0.45,
                            borderRadius: 8,
                            margin: const EdgeInsets.only(right: 16),
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 10),
                            border: Border.all(color: theme.dividerColorToGrey),
                            color: Theme.of(context)
                                .extension<ThemedColors>()!
                                .whiteToDark,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppIcons.location,
                                  color: theme.darkToWhite,
                                  height: 16,
                                  width: 16,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(width: 8),
                                Text('г. Ташкент',
                                    style:
                                        Theme.of(context).textTheme.subtitle1),
                                const Spacer(),
                                CircleAvatar(
                                  backgroundColor: warmerGrey,
                                  radius: 10,
                                  child: SvgPicture.asset(
                                    AppIcons.close,
                                    color: white,
                                    fit: BoxFit.cover,
                                    height: 14,
                                    width: 14,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SelectedCarInfo(),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, bottom: 14),
                        child: Row(
                          children: [
                            Text('60 отзыва',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(fontSize: 13)),
                            const Spacer(),
                            Text(
                              'Сначала положи...',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(width: 8),
                            WButton(
                              onTap: () {},
                              color: transparentButton,
                              child: SvgPicture.asset(AppIcons.arrowsSort),
                            )
                          ],
                        ),
                      ),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => Divider(
                            height: 12,
                            thickness: 0,
                            color: theme.borderGreyToDark),
                        itemBuilder: (context, index) =>
                            const ReviewMainContainer(
                          reviewCount: 3.6,
                          description:
                              '\n\nMercedes-Benz Sprinter — семейство малотоннажных\nавтомобилей компании Mercedes-Benz. Существует...',
                          carName: 'Mercedes-Benz Sprinter',
                          carImage:
                              'assets/images/car_single/car_single300kb.png',
                          subtitle: '',
                          commentCounts: 9,
                          publishTime: '09.09.2022',
                          viewCounts: 16,
                        ),
                      ),
                      const SizedBox(height: 124),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 40,
          right: MediaQuery.of(context).size.width * 0.4,
          child: WButton(
            onTap: () => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              useRootNavigator: true,
              backgroundColor: white,
              builder: (context) => SortBottomSheet(
                height: MediaQuery.of(context).size.height * 0.3,
                hasDivider: false,
                title: 'Категория',
                children: const [
                  ReviewBottomSheetItem(
                      icon: AppIcons.lightweightCar, title: 'Легковые'),
                  ReviewBottomSheetItem(
                      icon: AppIcons.truck, title: 'Коммерческие'),
                  ReviewBottomSheetItem(
                    icon: AppIcons.motorcycle,
                    title: 'Мото',
                    hasDivider: false,
                  ),
                ],
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
            ),
            height: 64,
            width: 64,
            borderRadius: 200,
            shadow: [
              BoxShadow(
                color: orange.withOpacity(0.6),
                offset: const Offset(0, 4),
                blurRadius: 20,
              )
            ],
            child: SvgPicture.asset(
              AppIcons.plus,
              color: white,
              height: 16,
              width: 16,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
