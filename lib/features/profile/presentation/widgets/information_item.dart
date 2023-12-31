import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class InformationGrid extends StatelessWidget {
  InformationGrid({required this.listData, Key? key, required this.color}) : super(key: key);

  final List<String> listData;
  final List<Color> color;

  final List colors = <Color>[
    const Color(0xffF7F7F8),
    const Color(0xffEBFAF0),
    const Color(0xffFDF4F3),
    const Color(0xffF2F4FC),
  ];

  final List subTitle = <String>[
    LocaleKeys.in_sale.tr(),
    LocaleKeys.views.tr(),
    LocaleKeys.added_favorites.tr(),
    LocaleKeys.calls.tr(),
  ];

  @override
  Widget build(BuildContext context) => GridView.builder(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 132 / 45,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: listData.length,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.only(top: 8, bottom: 8, left: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: color[index]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                listData[index],
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 16),
              ),
              Text(subTitle[index],
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Theme.of(context).extension<ThemedColors>()!.dolphinToGhost)),
            ],
          ),
        ),
      );
}
