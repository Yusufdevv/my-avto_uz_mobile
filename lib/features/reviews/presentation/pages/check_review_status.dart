import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/reviews/presentation/pages/review_single_car_screen.dart';
import 'package:auto/features/reviews/presentation/widgets/review_bottom_sheet_item.dart';
import 'package:auto/features/search/presentation/widgets/sort_bottom_sheet.dart';
import 'package:flutter/material.dart';

class CheckReviewStatus extends StatefulWidget {
  const CheckReviewStatus({super.key});

  @override
  State<CheckReviewStatus> createState() => _CheckReviewStatusState();
}

class _CheckReviewStatusState extends State<CheckReviewStatus>
 {
 

  @override
  Widget build(BuildContext context) => ReviewSingleCarScreen(
        shareFunction: () {},
        moreVertFunction: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            useRootNavigator: true,
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
                    // Platform.isIOS ?
                    // showDialog(
                    //   context: context,
                    //   builder: (context) => CupertinoAlertDialog(
                    //     title: Text(
                    //       'Удалить отзыв',
                    //       style: Theme.of(context)
                    //           .textTheme
                    //           .subtitle1!
                    //           .copyWith(fontSize: 16),
                    //     ),
                    //     content:
                    //         const Text('Вы действительно хотите удалить этот отзыв?'),
                    //     actions: [
                    //       WButton(
                    //         onTap: () {
                    //           Navigator.pop(context);
                    //         },
                    //         text: 'Отмена',
                    //         width: MediaQuery.of(context).size.width * 0.36,
                    //         textStyle: Theme.of(context)
                    //             .textTheme
                    //             .headline6!
                    //             .copyWith(fontSize: 13),
                    //         color: border,
                    //       ),
                    //       WButton(
                    //         onTap: () {
                    //           Navigator.pop(context);
                    //         },
                    //         width: MediaQuery.of(context).size.width * 0.36,
                    //         text: 'Удалить',
                    //         textStyle: Theme.of(context)
                    //             .textTheme
                    //             .headline6!
                    //             .copyWith(fontSize: 13, color: red),
                    //         color: tutu,
                    //       ),
                    //     ],
                    //   ),
                    // );
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Удалить отзыв'),
                        titlePadding: const EdgeInsets.only(left: 12, top: 12),
                        titleTextStyle: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(fontSize: 16),
                        content: const Text(
                            'Вы действительно хотите удалить этот отзыв?'),
                        contentPadding: const EdgeInsets.only(
                            left: 12, right: 12, top: 4, bottom: 8),
                        contentTextStyle: Theme.of(context).textTheme.headline2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        actions: [
                          WButton(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            text: 'Отмена',
                            width: MediaQuery.of(context).size.width * 0.36,
                            textStyle: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontSize: 13),
                            color: border,
                          ),
                          WButton(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            width: MediaQuery.of(context).size.width * 0.36,
                            text: 'Удалить',
                            textStyle: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontSize: 13, color: red),
                            color: tutu,
                          ),
                        ],
                        actionsAlignment: MainAxisAlignment.center,
                        actionsPadding: const EdgeInsets.all(12),
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
