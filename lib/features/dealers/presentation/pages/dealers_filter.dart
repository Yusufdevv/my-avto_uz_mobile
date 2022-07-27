import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
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
          title: 'Фильтр',
          titleStyle:
              Theme.of(context).textTheme.headline1!.copyWith(fontSize: 16),
          extraActions: const [
            Text('Очистить'),
            SizedBox(
              width: 16,
            )
          ],
        ),
        body: Container(
          color: Theme.of(context).extension<ThemedColors>()!.gainsboroToBlack,
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 50),
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
                    ContainerRegionMark(
                      markOrRegion: 'Марка',
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
                    ContainerRegionMark(
                      markOrRegion: 'Регион',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 44,
                width: double.maxFinite,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: orange,
                  ),
                  child: GestureDetector(
                    child: const Text(
                      'Применить',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
