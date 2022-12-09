import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/car_single/domain/entities/equipment_entity.dart';
import 'package:auto/features/car_single/presentation/widgets/equipment_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EquipmentCard extends StatefulWidget {
  const EquipmentCard({Key? key}) : super(key: key);

  @override
  State<EquipmentCard> createState() => _EquipmentCardState();
}

class _EquipmentCardState extends State<EquipmentCard> {
  final List<EquipmentEntity> entity = [
    const EquipmentEntity(title: 'Подушки безопасности боковые'),
    const EquipmentEntity(title: 'Подушки безопасности боковые'),
    const EquipmentEntity(title: 'Подушки безопасности боковые'),
    const EquipmentEntity(title: 'Подушки безопасности боковые'),
    const EquipmentEntity(title: 'Подушки безопасности боковые'),
    const EquipmentEntity(title: 'Подушки безопасности боковые'),
  ];

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).extension<ThemedColors>()!.solitudeToDarkRider,
            ),
            color: Theme.of(context).extension<ThemedColors>()!.whiteToNero),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Комплектация CLS 400 4MATIC',
              style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 12,
            ),
            ...List.generate(
              entity.length,
              (index) => Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: EquipmentTile(equipmentEntity: entity[index]),
              ),
            ),
            if (entity.length >= 6)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Показать все',
                    style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  SvgPicture.asset(
                    AppIcons.chevronDown,
                    color: purple,
                  ),
                ],
              )
            else
              const SizedBox(),
          ],
        ),
      );
}
