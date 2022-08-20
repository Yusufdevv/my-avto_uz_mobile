import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/car_single/domain/entities/equipment_entity.dart';
import 'package:flutter/material.dart';

class EquipmentTile extends StatelessWidget {
  final EquipmentEntity equipmentEntity;
  const EquipmentTile({required this.equipmentEntity, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Row(
      children: [
        Container(
          height: 6,
          width: 6,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).extension<ThemedColors>()!.darkToGrey
          ),
        ),
        const SizedBox(width: 8,),
        Text(equipmentEntity.title, style: Theme.of(context).textTheme.caption!.copyWith(color: Theme.of(context).extension<ThemedColors>()!.darkToGrey),)
      ],
    ),
  );
}
