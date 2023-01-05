import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class InformationItems extends StatefulWidget {
  const InformationItems({Key? key}) : super(key: key);

  @override
  State<InformationItems> createState() => _InformationItemsState();
}

class _InformationItemsState extends State<InformationItems> {
  final List title = <String>['8 неделя', '44', '12', '9'];

  final List color = <Color>[
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

  double finalAngle = 0;

  @override
  Widget build(BuildContext context) => GridView.builder(
        padding:const EdgeInsets.all(0),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 132 / 53,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: 4,
        itemBuilder: (context, index) => WScaleAnimation(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: color[index]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title[index],
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 16),
                ),
                Text(subTitle[index],
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: grey)),
              ],
            ),
          ),
        ),
      );
}
