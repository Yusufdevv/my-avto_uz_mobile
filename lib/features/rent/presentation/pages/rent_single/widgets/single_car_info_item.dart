import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/rent/domain/entities/rent_car_entity.dart';
import 'package:auto/features/rent/presentation/pages/rent_single/widgets/info_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SingleCarInfoItemm extends StatelessWidget {
  final RentCarEntity rentCarEntity;

  const SingleCarInfoItemm({required this.rentCarEntity, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.about_car.tr(),
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 8,
            ),
            InfoItem(
                title: LocaleKeys.year_of_issue.tr(),
                description: rentCarEntity.year.toString()),
            InfoItem(
                title: LocaleKeys.Mileage.tr(),
                description:
                    '${MyFunctions.getFormatCost(rentCarEntity.distanceTraveled.toString())} km'),
            InfoItem(
                title: LocaleKeys.body.tr(),
                description: rentCarEntity.bodyType.type),
            InfoItem(
                title: LocaleKeys.color.tr(), description: rentCarEntity.color),
            InfoItem(
              title: LocaleKeys.complectation.tr(),
              description: rentCarEntity.type.name,
              textStyle:
                  Theme.of(context).textTheme.titleSmall!.copyWith(color: blue),
            ),
            InfoItem(
                title: LocaleKeys.engine_volume_l.tr(),
                description: rentCarEntity.engineType.type),
            InfoItem(
                title: LocaleKeys.Transmission.tr(),
                description: rentCarEntity.gearboxType.type),
            InfoItem(
              title: LocaleKeys.conditioner.tr(),
              description: rentCarEntity.hasAirConditioner
                  ? LocaleKeys.have.tr()
                  : LocaleKeys.no.tr(),
            ),
            InfoItem(
                title: LocaleKeys.drive_unit.tr(),
                description: rentCarEntity.driveType.type),
          ],
        ),
      );
}
