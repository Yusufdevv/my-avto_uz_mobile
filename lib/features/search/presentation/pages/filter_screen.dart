import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/range_slider.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_chips.dart';
import 'package:auto/features/search/presentation/widgets/selector_item.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: WAppBar(
          boxShadow: [],
          extraActions: [
            Text('Фильтр',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
            const Spacer(
              flex: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Очистить',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: blue),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
              16, 20, 16, MediaQuery.of(context).padding.bottom + 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Что показывать',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  WChips(title: 'Объявления'),
                  SizedBox(
                    width: 12,
                  ),
                  WChips(title: 'Марки'),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Дилеры по продаже автомобилей',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  WChips(title: 'Новые'),
                  SizedBox(
                    width: 12,
                  ),
                  WChips(title: 'С пробегом'),
                ],
              ),
              const SizedBox(height: 16),
              SelectorItem(
                onTap: () {},
                hintText: 'Выберите регион',
                title: 'Регион',
                screenName: 'search',
              ),
              SelectorItem(
                onTap: () {},
                hintText: 'Выберите марку',
                title: 'Марка',
                screenName: 'search',
              ),
              SelectorItem(
                onTap: () {},
                hintText: 'Выберите тип кузова',
                title: 'Тип кузова',
                screenName: 'search',
              ),
              SelectorItem(
                onTap: () {},
                hintText: 'Выберите класс',
                title: 'Класс',
                screenName: 'search',
              ),
              SelectorItem(
                onTap: () {},
                hintText: 'Выберите тип привода',
                title: 'Привод',
                screenName: 'search',
              ),
              SelectorItem(
                onTap: () {},
                hintText: 'Выберите тип коробки',
                title: 'Коробка',
                screenName: 'search',
              ),
              const WRangeSlider(
                title: 'Год выпуска',
                endValue: 2022,
                startValue: 1960,
                sliderStatus: '',
              ),
              const SizedBox(height: 16),
              const WRangeSlider(
                title: 'Цена',
                endValue: 500000,
                startValue: 1000,
                sliderStatus: 'price',
              ),
              const SizedBox(height: 30),
              WButton(
                onTap: () {},
                text: 'Применить',
              )
            ],
          ),
        ),
      );
}
