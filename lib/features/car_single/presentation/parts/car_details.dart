import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
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
  final String uzb;final String gasBalloonInfo;

  const CarDetails({
    required this.year,
    required this.mileage,
    required this.body,
    required this.color,
    required this.complectation,
    required this.engineVolume,
    required this.gearType,
    required this.uzb,
    required this.gasBalloonInfo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
        child: Column(children: [
          CarInfoTile(
            text: LocaleKeys.years_of_issue.tr(),
            value: year,
          ),
          CarInfoTile(
            text: LocaleKeys.Mileage.tr(),
            value: '$mileage ${LocaleKeys.km.tr()}',
          ),
          CarInfoTile(
            text: LocaleKeys.body.tr(),
            value: body,
          ),
          CarInfoTile(
            text: LocaleKeys.color.tr(),
            value: color,
          ),
          CarInfoTile(
            text:LocaleKeys.complectation.tr(),
            value: complectation,
          ),
          CarInfoTile(
            text: LocaleKeys.engine_volume.tr(),
            value: engineVolume,
          ),
          CarInfoTile(
            text: LocaleKeys.gas_ballon_equipment.tr(),
            value: gasBalloonInfo,
          ),
          CarInfoTile(
            text: LocaleKeys.drive_gearbox.tr(),
            value: gearType,
          ),
          CarInfoTile(
            text: LocaleKeys.rastamojen_v_uzbekistan.tr(),
            value: uzb,
          ),
        ]),
      );
}
