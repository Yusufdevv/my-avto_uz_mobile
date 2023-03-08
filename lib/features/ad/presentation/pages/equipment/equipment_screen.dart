import 'dart:developer';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/domain/entities/equipment/equipment_entity.dart';
import 'package:auto/features/ad/domain/entities/equipment/equipment_options_list_entity.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/ad/presentation/widgets/equipment_category.dart';
import 'package:auto/features/ad/presentation/widgets/pos_radio_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EquipmentScreen extends StatelessWidget {
  final List<EquipmentEntity> equipments;
  final EquipmentEntity? equipment;
  final List<EquipmentOptionsListEntity> equipmentOptionsList;
  final Function(EquipmentEntity) onEquipmentSelected;
  final IsOptionSelected isOptionSelected;
  final OnEquipmentOptionPressed onEquipmentOptionPressed;
  final Map<int, SO> selectOptions;

  const EquipmentScreen(
      {required this.onEquipmentSelected,
      required this.equipmentOptionsList,
      required this.equipments,
      required this.isOptionSelected,
      required this.selectOptions,
      required this.onEquipmentOptionPressed,
      Key? key,
      this.equipment})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      body: BaseWidget(
        headerText: LocaleKeys.complectation.tr(),
        padding: const EdgeInsets.only(top: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (equipments.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    LocaleKeys.buyers_more_call_on_add.tr(),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 14,
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .aluminumToDolphin,
                        ),
                  ),
                ),
              if (equipments.isNotEmpty) const SizedBox(height: 16),
              if (equipments.isNotEmpty)
                ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => PostingRadioItem(
                    onTap: () {
                      onEquipmentSelected(index < equipments.length
                          ? equipments[index]
                          : const EquipmentEntity());
                    },
                    title: index < equipments.length
                        ? equipments[index].name
                        : LocaleKeys.other1.tr(),
                    selected: index < equipments.length
                        ? equipment?.id == equipments[index].id
                        : equipment == null,
                    image: '',
                  ),
                  itemCount: equipments.length + 1,
                  shrinkWrap: true,
                ),
              if (equipments.isNotEmpty) const Divider(indent: 16),
              if (equipments.isNotEmpty) const SizedBox(height: 12),
              if (equipments.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
                  child: Text(
                    LocaleKeys.additional_options.tr(),
                    style: const TextStyle(
                      color: black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => EquipmentCategory(
                  isOptionSelected: isOptionSelected,
                  selectOptions: selectOptions,
                  categoryName: equipmentOptionsList[index].name,
                  options: equipmentOptionsList[index].options,
                  onEquipmentOptionPressed: onEquipmentOptionPressed,
                ),
                itemCount: equipmentOptionsList.length,
                shrinkWrap: true,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
              ),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
}
