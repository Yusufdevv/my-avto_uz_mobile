import 'dart:html';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({super.key});

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  int completed = 0;
  final List<String> titles = [
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
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const WAppBar(
          hasBackButton: true,
          title: 'Добавить отзыв',
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                      percent: completed / 13,
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
                itemBuilder: (context, index) =>
                    SelectCarCharactersItem(title: titles[index]),
                separatorBuilder: (context, index) => const Divider(
                    height: 1, thickness: 1, color: border, indent: 16),
              ),
            ],
          ),
        ),
      );
}

class SelectCarCharactersItem extends StatelessWidget {
  const SelectCarCharactersItem({
    required this.title,
    required this.onTap,
    this.subtitle,
    Key? key,
  }) : super(key: key);
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => WButton(
        onTap: onTap,
        color: white,
        height: 54,
        child: ListTile(
          title: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(fontSize: subtitle == null ? 16 : 13),
          ),
          subtitle: subtitle == null
              ? null
              : Text(
                  subtitle!,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontWeight: FontWeight.w400, fontSize: 16, color: dark),
                ),
          trailing: SvgPicture.asset(AppIcons.chevronRight, color: darkGray),
        ),
      );
}
