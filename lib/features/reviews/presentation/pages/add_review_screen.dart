import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/reviews/presentation/pages/publication_my_review.dart';
import 'package:auto/features/reviews/presentation/widgets/select_car_character_item.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AddReviewScreen extends StatefulWidget {
  final String category;
  const AddReviewScreen({required this.category, super.key});

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  int completed = 0;
  final List<String> titles = [
    'Категория',
    'Марка',
    'Модель',
    'Год выпуска',
    'Покаление',
    'Тип кузова',
    'Двигатель',
    'Тип привода',
    'Тип коробки передач',
    'Модификация',
    'Срок владения',
    'Плюсы',
    'Минусы',
    'Оценки'
  ];
  bool isButtonActive = true;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const WAppBar(
          hasBackButton: true,
          title: 'Добавить отзыв',
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircularPercentIndicator(
                      radius: 15,
                      lineWidth: 3,
                      percent: completed / titles.length,
                      backgroundColor: border,
                      progressColor: hoursGreen,
                    ),
                    const SizedBox(width: 12),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Автомобиль\n',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          TextSpan(
                            text: 'Заполнено $completed из 13',
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ListView.separated(
                itemCount: titles.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => SelectCarCharactersItem(
                  title: titles[index],
                  onTap: () {},
                  subtitle: widget.category,
                ),
                separatorBuilder: (context, index) => const Divider(
                    height: 17, thickness: 1, color: border, indent: 16),
              ),
              WButton(
                onTap: () {
                  Navigator.of(context)
                      .push(fade(page: const PublicationMyReview()));
                },
                text: 'Далее',
                textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isButtonActive ? white : dividerColor),
                color: orange,
                borderRadius: 8,
                disabledColor: warmerGrey,
                isDisabled: !isButtonActive,
                margin: const EdgeInsets.only(
                    left: 16, right: 16, top: 44, bottom: 33),
                shadow: const [
                  BoxShadow(
                    color: warmerGrey,
                    offset: Offset(0, 4),
                    blurRadius: 20,
                  )
                ],
                height: 44,
              ),
            ],
          ),
        ),
      );
}
