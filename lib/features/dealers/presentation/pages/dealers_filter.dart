import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/dealers/presentation/widgets/filter_radio.dart';
import 'package:auto/features/dealers/presentation/widgets/filter_region_mark_container.dart';
import 'package:flutter/material.dart';

class DealersFilter extends StatefulWidget {
  const DealersFilter({Key? key}) : super(key: key);

  @override
  State<DealersFilter> createState() => _DealersFilterState();
}

enum Category { all, news, withMileage }

class _DealersFilterState extends State<DealersFilter> {
  Category selectedCategory = Category.all;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: WAppBar(
          backgroundColor:
              Theme.of(context).extension<ThemedColors>()!.whiteToNero,
          titleStyle:
              Theme.of(context).textTheme.headline1!.copyWith(fontSize: 16),
          extraActions: [
            Text('Фильтр',
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
                'Очистить',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: blue),
              ),
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Дилеры по продаже автомобилей',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context)
                                .extension<ThemedColors>()!
                                .greySuitToWhite)),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FilterRadio(
                            value: Category.all,
                            onChanged: (value) {
                              setState(() => selectedCategory = value);
                            },
                            currentValue: selectedCategory),
                        FilterRadio(
                            value: Category.news,
                            onChanged: (value) {
                              setState(() => selectedCategory = value);
                            },
                            currentValue: selectedCategory),
                        FilterRadio(
                            value: Category.withMileage,
                            onChanged: (value) {
                              setState(() => selectedCategory = value);
                            },
                            currentValue: selectedCategory),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text('Регион',
                        style: TextStyle(
                            color: Theme.of(context)
                                .extension<ThemedColors>()!
                                .greySuitToWhite,
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                    const SizedBox(height: 8),
                    const ContainerRegionMark(
                      markOrRegion: 'Регион',
                    ),
                    const SizedBox(height: 16),
                    Text('Марка',
                        style: TextStyle(
                            color: Theme.of(context)
                                .extension<ThemedColors>()!
                                .greySuitToWhite,
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                    const SizedBox(height: 8),
                    const ContainerRegionMark(
                      markOrRegion: 'Марка',
                    ),
                  ],
                ),
              ),
              WButton(
                textStyle:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                onTap: () {},
                text: 'Применить',
              )
            ],
          ),
        ),
      );
}
