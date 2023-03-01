import 'dart:developer';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/domain/entities/equipment/equipment_entity.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/ad/presentation/widgets/equipment_category.dart';
import 'package:auto/features/ad/presentation/widgets/pos_radio_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EquipmentScreen extends StatelessWidget {
  const EquipmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BaseWidget(
          headerText: LocaleKeys.complectation.tr(),
          padding: const EdgeInsets.only(top: 16),
          child: BlocBuilder<PostingAdBloc, PostingAdState>(
              builder: (context, state) {
            log(':::::::::: equipments lenth:  ${state.equipments.length}   ::::::::::');
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (state.equipments.isNotEmpty)
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
                  if (state.equipments.isNotEmpty) const SizedBox(height: 16),
                  if (state.equipments.isNotEmpty)
                    ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => PostingRadioItem(
                        onTap: () => context.read<PostingAdBloc>().add(
                              PostingAdChooseEvent(
                                equipment: index < state.equipments.length
                                    ? state.equipments[index]
                                    : const EquipmentEntity(),
                              ),
                            ),
                        title: index < state.equipments.length
                            ? state.equipments[index].name
                            : LocaleKeys.other1.tr(),
                        selected: index < state.equipments.length
                            ? state.equipment?.id == state.equipments[index].id
                            : state.equipment?.id == -1,
                        image: '',
                      ),
                      itemCount: state.equipments.length + 1,
                      shrinkWrap: true,
                    ),
                  if (state.equipments.isNotEmpty) const Divider(indent: 16),
                  if (state.equipments.isNotEmpty) const SizedBox(height: 12),
                  if (state.equipments.isNotEmpty)
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
                      categoryName: state.equipmentOptionsList[index].name,
                      options: state.equipmentOptionsList[index].options,
                      onTap: (i, id, name) {
                        context.read<PostingAdBloc>().add(
                              PostingAdChangeOption(
                                categoryIndex: index,
                                optionIndex: i,
                                type: state.equipmentOptionsList[index]
                                    .options[i].type,
                                id: id,
                                selectedItem: name,
                              ),
                            );
                      },
                    ),
                    itemCount: state.equipmentOptionsList.length,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                  ),
                  const SizedBox(height: 70),
                ],
              ),
            );
          }),
        ),
      );
}
