import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/reviews/presentation/pages/review_single_car_screen.dart';
import 'package:auto/features/reviews/presentation/widgets/review_bottom_sheet_item.dart';
import 'package:auto/features/search/presentation/widgets/sort_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckReviewStatus extends StatefulWidget {
  const CheckReviewStatus({super.key});

  @override
  State<CheckReviewStatus> createState() => _CheckReviewStatusState();
}

class _CheckReviewStatusState extends State<CheckReviewStatus> {
  @override
  Widget build(BuildContext context) => ReviewSingleCarScreen(
        shareFunction: () {},
        moreVertFunction: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            useRootNavigator: true,
            isDismissible: false,
            backgroundColor: white,
            builder: (context) => SortBottomSheet(
              height: MediaQuery.of(context).size.height * 0.23,
              hasDivider: false,
              title: 'Действия',
              children: [
                ReviewBottomSheetItem(
                  icon: AppIcons.edit,
                  iconHeight: 24,
                  iconWidth: 24,
                  title: 'Редактировать',
                  onTap: () {},
                ),
                ReviewBottomSheetItem(
                  icon: AppIcons.trash,
                  title: 'Удалить',
                  onTap: () {
                    Navigator.pop(context);
                    showModalBottomSheet(
                      context: context,
                      useRootNavigator: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      isScrollControlled: true,
                      isDismissible: false,
                      builder: (context) => Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                          color: white,
                        ),
                        height: MediaQuery.of(context).size.height * 0.375,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 20),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.all(4),
                              width: double.maxFinite,
                              child: WButton(
                                height: 32,
                                width: 32,
                                color: transparentButton,
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: SvgPicture.asset(AppIcons.close),
                              ),
                            ),
                            Text(
                              'Вы действительно\nхотите удалить отзыв?',
                              style: Theme.of(context).textTheme.headline1,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Удаление будет безворзвратным и\nвосстановление отзыва будет\nневозможным.',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 32),
                            Row(
                              children: [
                                Expanded(
                                  child: WButton(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    text: 'Нет',
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(color: darkGray),
                                    color: border,
                                    height: 44,
                                  ),
                                ),
                                const SizedBox(width: 13),
                                Expanded(
                                  child: WButton(
                                    onTap: () {},
                                    text: 'Да',
                                    color: tutu,
                                    height: 44,
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(color: red),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  hasDivider: false,
                ),
              ],
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
          );
        },
        hasMoreVert: true,
        images: List.generate(
            24, (index) => 'https://source.unsplash.com/random/1'),
        titleCarInfo: 'BMW 5 серии VII (G30/G31)',
        subtitleCarInfo: 'Модификация 530d xDrive 3.0d AT (249 л.с.)\n4WD',
        avatarPicture: 'https://source.unsplash.com/random/1',
        reviewName: 'Ракета 530 D 🚀\n',
        publishDate: '24 февраля 2022',
        owner: 'Мухаммадамин',
        lastOnline: '12 января 2022 г.',
        shortDescription:
            'Хотелось купить машину быстрее этой, если у вас есть\nна руке быстрее этой машины, качественнее и\nмощнее, я могу купить. Но все таки, за все время не\nпожалел владением этой машины, очень комфортно,\nЗа год и 4 месяца не вызвала нареканий в сервисе\nбыла только на ТО , расход топлива умеренный , хотя\nи пробег не большой у машины , брал жене а катался\nсам она только пару раз прокатилась , ей больше моя\nнравиться Санта ФЕ , так что машина была только для\nразъезда по городу и для отвоза ребёнка в школу и\nобратно...',
        fullDescription:
            'Хотелось купить машину быстрее этой, если у вас есть\nна руке быстрее этой машины, качественнее и\nмощнее, я могу купить. Но все таки, за все время не\nпожалел владением этой машины, очень комфортно,\nЗа год и 4 месяца не вызвала нареканий в сервисе\nбыла только на ТО , расход топлива умеренный , хотя\nи пробег не большой у машины , брал жене а катался\nсам она только пару раз прокатилась , ей больше моя\nнравиться Санта ФЕ , так что машина была только для\nразъезда по городу и для отвоза ребёнка в школу и\nобратно...',
        commentsCount: 38,
        viewsCount: 276,
        overallRating: 3.6,
        pluses: const [
          'Вместительность салона',
          'Обзорность',
          'Дизайн',
          'Шумоизоляция',
          'Безопасность'
        ],
        minuses: const ['Качество сборки', 'Коробка передач'],
        comfortRating: 4,
        drivingRating: 2,
        securityRating: 3,
        appearanceRating: 1,
        reliabilityRating: 3,
      );
}
