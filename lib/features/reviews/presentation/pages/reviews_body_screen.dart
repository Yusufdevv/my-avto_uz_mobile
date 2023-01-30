import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/reviews/presentation/pages/review_single_car_screen.dart';
import 'package:auto/features/reviews/presentation/pages/select_brand_screen.dart';
import 'package:auto/features/reviews/presentation/parts/selected_car_info.dart';
import 'package:auto/features/reviews/presentation/widgets/review_item_shimmer.dart';
import 'package:auto/features/reviews/presentation/widgets/review_main_container.dart';
import 'package:auto/features/reviews/presentation/widgets/select_model_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';

class ReviewsBodyScreen extends StatefulWidget {
  const ReviewsBodyScreen(
      {required this.imageUrl,
      required this.avgRating,
      required this.minuses,
      required this.pluses,
      required this.reviewCount,
      required this.appearanceRating,
      required this.comfortRating,
      required this.drivingRating,
      required this.reliabilityRating,
      required this.securityRating,
      required this.status,
      super.key});
  final List<String> pluses;
  final List<String> minuses;
  final int reviewCount;
  final FormzStatus status;
  final String imageUrl;
  final double avgRating;
  final double appearanceRating;
  final double comfortRating;
  final double securityRating;
  final double drivingRating;
  final double reliabilityRating;

  @override
  State<ReviewsBodyScreen> createState() => _ReviewsBodyScreenState();
}

class _ReviewsBodyScreenState extends State<ReviewsBodyScreen> {
  bool firstPositive = true;

  final List<String> owner = ['Анвар Гулямов', 'ORIENT MOTORS'];

  final List<String> ownerType = ['Частное лицо', 'Автосалон'];

  final List<String> publishTime = ['Сегодня', '27 февраля'];

  final List<String> sellType = ['Продажа Автомобиля', 'Аренда c выкупом'];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemedColors>()!;
    return Column(
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
                    Navigator.push(
                      context,
                      fade(page: const SelectBrandScreen()),
                    );
                  },
                  title: 'Поиск по марке и моделю',
                  suffixIconColor: paleCornflowerBlue,
                  suffixIconPath: AppIcons.search,
                  color: purple,
                  shadowColor: blueGem.withOpacity(0.3),
                  blurRadius: 24,
                ),
                SelectedCarInfo(
                  pluses: widget.pluses,
                  minuses: widget.minuses,
                  reviewCount: widget.reviewCount,
                  image: widget.imageUrl,
                  avgRating: widget.avgRating,
                  appearanceRating: widget.appearanceRating,
                  comfortRating: widget.comfortRating,
                  drivingRating: widget.drivingRating,
                  reliabilityRating: widget.reliabilityRating,
                  securityRating: widget.securityRating,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 14),
                  child: Row(
                    children: [
                      Text('${widget.reviewCount} отзыва',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(fontSize: 13)),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            firstPositive = !firstPositive;
                          });
                        }, behavior: HitTestBehavior.opaque,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          child: Text(
                            firstPositive
                                ? 'Сначала положи...'
                                : 'Сначала отрица...',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
                                    fontSize: 13, fontWeight: FontWeight.w400),
                          ),
                        ),
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
                Expanded(
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    separatorBuilder: (context, index) => Divider(
                        height: 12,
                        thickness: 0,
                        color: theme.borderGreyToDark),
                    itemBuilder: (context, index) => widget.status !=
                            FormzStatus.submissionSuccess
                        ? const ReviewItemShimmer()
                        : ReviewMainContainer(
                            onTap: () {
                              Navigator.push(
                                context,
                                fade(
                                  page: ReviewSingleCarScreen(
                                    hasMoreVert: false,
                                    images: List.generate(
                                        24,
                                        (index) =>
                                            'https://source.unsplash.com/random/1'),
                                    titleCarInfo: 'BMW 5 серии VII (G30/G31)',
                                    subtitleCarInfo:
                                        'Модификация 530d xDrive 3.0d AT (249 л.с.)\n4WD',
                                    avatarPicture:
                                        'https://source.unsplash.com/random/1',
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
                                    minuses: const [
                                      'Качество сборки',
                                      'Коробка передач'
                                    ],
                                    shareFunction: () {},
                                    comfortRating: 4,
                                    drivingRating: 2,
                                    securityRating: 3,
                                    appearanceRating: 1,
                                    reliabilityRating: 3,
                                  ),
                                ),
                              );
                            },
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
                ),
                const SizedBox(height: 124),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
