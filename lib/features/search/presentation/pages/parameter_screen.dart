import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/range_slider.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/search/presentation/widgets/selector_item.dart';
import 'package:flutter/material.dart';

class ParameterScreen extends StatefulWidget {
  const ParameterScreen({Key? key}) : super(key: key);

  @override
  State<ParameterScreen> createState() => _ParameterScreenState();
}

class _ParameterScreenState extends State<ParameterScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor:
            Theme.of(context).extension<ThemedColors>()!.whiteToBlack,
        appBar: WAppBar(
          extraActions: [
            Text('Параметры',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
            const Spacer(
              flex: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Сбросить',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: blue),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectorItem(
                        onTap: () {},
                        hintText: 'Выберите тип кузова',
                        title: 'Тип кузова',
                      ),
                      SelectorItem(
                        onTap: () {},
                        hintText: 'Выберите класс',
                        title: 'Класс',
                      ),
                      SelectorItem(
                        onTap: () {},
                        hintText: 'Выберите тип привода',
                        title: 'Привод',
                      ),
                      SelectorItem(
                        onTap: () {},
                        hintText: 'Выберите тип коробки',
                        title: 'Коробка',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const WRangeSlider(
                        title: 'Год выпуска',
                        endValue: 2022,
                        startValue: 1960,
                        sliderStatus: '',
                      ),
                      const SizedBox(height: 20),
                      const WRangeSlider(
                        title: 'Цена',
                        endValue: 500000,
                        startValue: 1000,
                        sliderStatus: 'price',
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom + 20),
                child: WButton(
                  onTap: () {},
                  text: 'Применить',
                ),
              )
            ],
          ),
        ),
      );
}
