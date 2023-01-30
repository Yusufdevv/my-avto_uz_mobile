import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/car_single/domain/entities/car_detail.dart';
import 'package:auto/features/car_single/presentation/widgets/car_info_tile.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CarDetails extends StatelessWidget {
  final String year;
  final String mileage;
  final String body;
  final String color;
  final String complectation;
  final String engineVolume;
  final String gearType;
  final String uzb;

  const CarDetails({
    required this.year,
    required this.mileage,
    required this.body,
    required this.color,
    required this.complectation,
    required this.engineVolume,
    required this.gearType,
    required this.uzb,
    Key? key,
  }) : super(key: key);

  static List<CarDetailEntity> list = [
    CarDetailEntity(
      value: '2016',
      title: LocaleKeys.year_of_issue.tr(),
    ),
    CarDetailEntity(
      value: '98 000 км',
      title: LocaleKeys.Mileage.tr(),
    ),
    CarDetailEntity(value: 'Седан', title: 'Кузов'),
    CarDetailEntity(value: '''Черный
(металлик)''', title: LocaleKeys.color.tr()),
    CarDetailEntity(
      value: 'Luxury',
      title: LocaleKeys.complectation.tr(),
    ),
    CarDetailEntity(value: '2.1', title: 'Объем двигателя, л'),
    CarDetailEntity(value: 'Механика', title: LocaleKeys.drive_gearbox.tr()),
    CarDetailEntity(value: 'Да', title: 'Растаможен в Узбекистане'),
  ];

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
            border: Border(
                bottom: BorderSide(
                    width: 1,
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .solitudeToDarkRider))),
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
        child: Column(children: [
          CarInfoTile(
            text: LocaleKeys.years_of_issue.tr(),
            value: year,
          ),
          CarInfoTile(
            text: LocaleKeys.Mileage.tr(),
            value: '$mileage км',
          ),
          CarInfoTile(
            text: LocaleKeys.body.tr(),
            value: body,
          ),
          CarInfoTile(
            text: LocaleKeys.color.tr(),
            value: color,
          ),
          // CarInfoTile(
          //   text: 'Комплектация',
          //   value: complectation,
          // ),
          CarInfoTile(
            text: LocaleKeys.engine_volume.tr(),
            value: engineVolume,
          ),
          CarInfoTile(
            text: LocaleKeys.drive_gearbox.tr(),
            value: gearType,
          ),
          CarInfoTile(
            text: 'Растаможен в Узбекистане',
            value: uzb,
          ),
        ]),
      );
}
