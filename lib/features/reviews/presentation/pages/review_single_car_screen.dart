import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/reviews/presentation/parts/car_show_rating_field.dart';
import 'package:auto/features/reviews/presentation/parts/navigate_comments_button.dart';
import 'package:auto/features/reviews/presentation/parts/review_single_car_actions.dart';
import 'package:auto/features/reviews/presentation/parts/single_car_information_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReviewSingleCarScreen extends StatefulWidget {
  const ReviewSingleCarScreen({super.key});

  @override
  State<ReviewSingleCarScreen> createState() => _ReviewSingleCarScreenState();
}

class _ReviewSingleCarScreenState extends State<ReviewSingleCarScreen> {
  int currentState = 1;
  CrossFadeState crossFadeState = CrossFadeState.showFirst;
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: borderCircular,
        appBar: WAppBar(
          centerTitle: false,
          hasBackButton: true,
          extraActions: [
            WScaleAnimation(
              child: SvgPicture.asset(
                AppIcons.share,
                color: grey,
                fit: BoxFit.cover,
                width: 24,
                height: 24,
              ),
              onTap: () {},
            ),
            const SizedBox(width: 16),
          ],
          title: 'Отзыв',
          titleStyle:
              Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 16),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SingleCarInformationItem(),
              Stack(
                children: [
                  CarouselSlider.builder(
                    itemCount: 24,
                    itemBuilder: (context, index, realIndex) => Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://source.unsplash.com/random/$index'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: 219,
                    ),
                    options: CarouselOptions(
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentState = index + 1;
                        });
                      },
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 17,
                    child: AnimatedCrossFade(
                      firstChild: Text('$currentState/24',
                          style: Theme.of(context).textTheme.bodyText1),
                      secondChild: Text('${currentState + 1}/24',
                          style: Theme.of(context).textTheme.bodyText1),
                      crossFadeState: CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 500),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Ракета 530 D 🚀\n',
                          style: Theme.of(context).textTheme.headline1),
                      TextSpan(
                          text: '24 февраля 2022',
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(fontSize: 13)),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, left: 16),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 22,
                      backgroundImage:
                          NetworkImage('https://source.unsplash.com/random/1'),
                    ),
                    const SizedBox(width: 8),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Мухаммадамин\n',
                              style: Theme.of(context).textTheme.subtitle1),
                          TextSpan(
                            text: '12 января 2022 г.',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: dividerColor,
                endIndent: 16,
                indent: 16,
                thickness: 1,
                height: 37,
              ),
              AnimatedCrossFade(
                firstChild: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                'Хотелось купить машину быстрее этой, если у вас есть\nна руке быстрее этой машины, качественнее и\nмощнее, я могу купить. Но все таки, за все время не\nпожалел владением этой машины, очень комфортно,\nЗа год и 4 месяца не вызвала нареканий в сервисе\nбыла только на ТО , расход топлива умеренный , хотя\nи пробег не большой у машины , брал жене а катался\nсам она только пару раз прокатилась , ей больше моя\nнравиться Санта ФЕ , так что машина была только для\nразъезда по городу и для отвоза ребёнка в школу и\nобратно...',
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(fontSize: 13),
                          ),
                          WidgetSpan(
                            child: WScaleAnimation(
                              child: Text(
                                'Больше',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(
                                      color: orange,
                                      fontSize: 13,
                                    ),
                              ),
                              onTap: () {
                                setState(() {
                                  crossFadeState = CrossFadeState.showSecond;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    )),
                secondChild: WScaleAnimation(
                  child: Text(
                    'Back',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: orange,
                          fontSize: 13,
                        ),
                  ),
                  onTap: () {
                    setState(() {
                      crossFadeState = CrossFadeState.showFirst;
                    });
                  },
                ),
                firstCurve: Curves.linear,
                secondCurve: Curves.linear,
                crossFadeState: crossFadeState,
                duration: const Duration(milliseconds: 3000),
              ),
              const Divider(
                color: dividerColor,
                endIndent: 16,
                indent: 16,
                thickness: 1,
                height: 37,
              ),
              const ReviewSingleCarActions(),
              const SizedBox(height: 16),
              const Divider(color: dividerColor, thickness: 1),
              const SizedBox(height: 25),
              const CarShowRatingField(),
              const SizedBox(height: 25),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                    border: Border.all(color: border, width: 1),
                    borderRadius: BorderRadius.circular(12),
                    color: white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    ReviewWrapBuilder(
                      title: 'Плюсы',
                      titleIcon: AppIcons.plus,
                      iconColor: green,
                      labels: [
                        'Вместительность салона',
                        'Обзорность',
                        'Дизайн',
                        'Шумоизоляция',
                        'Безопасность'
                      ],
                    ),
                    SizedBox(height: 20),
                    ReviewWrapBuilder(
                      title: 'Минусы',
                      titleIcon: AppIcons.minus,
                      iconColor: red,
                      labels: ['Качество сборки', 'Коробка передач'],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const NavigateCommentsButton()
            ],
          ),
        ),
      );
}

class ReviewWrapBuilder extends StatelessWidget {
  final List<String> labels;
  final String title;
  final String titleIcon;
  final Color iconColor;
  const ReviewWrapBuilder({
    required this.labels,
    required this.title,
    required this.titleIcon,
    required this.iconColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: iconColor.withOpacity(0.1),
                ),
                height: 20,
                width: 20,
                padding: const EdgeInsets.all(4),
                child: SvgPicture.asset(
                  titleIcon,
                  color: iconColor,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 12.5),
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: [
              for (var i in labels)
                Chip(
                  label: Text(
                    i,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: border, width: 1),
                    borderRadius: BorderRadius.circular(44),
                  ),
                  backgroundColor: borderCircular,
                )
            ],
          ),
        ],
      );
}
