import 'dart:developer';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/domain/entities/equipment/equipment_option_entity.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/widgets/equipment_option_sheet.dart';
import 'package:auto/features/common/widgets/w_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EquipmentCategory extends StatelessWidget {
  const EquipmentCategory({
    required this.categoryName,
    required this.options,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String categoryName;
  final List<EquipmentOptionEntity> options;
  final Function(PostingAdChangeOption) onTap;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<PostingAdBloc, PostingAdState>(
        builder: (context, state) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              child: Text(
                categoryName ,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: greyText),
              ),
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  if (options[index].type == 'select') {
                    showModalBottomSheet<Map<int?, String?>>(
                      context: context,
                      useRootNavigator: true,
                      isScrollControlled: true,
                      backgroundColor: LightThemeColors.appBarColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      clipBehavior: Clip.hardEdge,
                      builder: (context) => EquipmentOptionSheet(
                        selected: state.isOptionSelected(
                                type: 'select', id: options[index].id)
                            ? state.selectOptions[options[index].id]?.id ?? -1
                            : -1,
                        name: options[index].name,
                        items: options[index].items,
                      ),
                    ).then((value) {
                      if (value != null) {
                        onTap(PostingAdChangeOption(
                            isAdd: true,
                            id: options[index].id,
                            itemName: options[index].name,
                            selectOption: SO(
                                optionName: value.values.first!,
                                id: value.keys.first!),
                            type: 'select'));
                      }
                    });
                  } else {
                    final v = PostingAdChangeOption(
                      itemName: options[index].name,
                      id: options[index].id,
                      type: 'radio',
                      isAdd: !state.isOptionSelected(
                          type: 'radio', id: options[index].id),
                    );
                    log('::::::::::  on radio tap in in: $v  ::::::::::');
                    onTap(v);
                  }
                },
                child: Container(
                  color: state.isOptionSelected(
                              type: options[index].type,
                              id: options[index].id) ||
                          options[index].type == 'radio'
                      ? null
                      : greyLight,
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 16, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          state.isOptionSelected(
                                      type: options[index].type,
                                      id: options[index].id) &&
                                  options[index].type == 'select'
                              ? state.selectOptions[options[index].id]
                                      ?.optionName ??
                                  ''
                              : options[index].name,
                          style: TextStyle(
                            color: state.isOptionSelected(
                                        type: options[index].type,
                                        id: options[index].id) ||
                                    options[index].type == 'radio'
                                ? black
                                : grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 3,
                        ),
                      ),
                      if (options[index].type == 'radio')
                        WCheckBox(
                          isChecked: state.isOptionSelected(
                              type: options[index].type, id: options[index].id),
                          checkBoxColor: orange,
                        )
                      else
                        SvgPicture.asset(
                          AppIcons.chevronRight,
                          color: greyText,
                        ),
                    ],
                  ),
                ),
              ),
              shrinkWrap: true,
              separatorBuilder: (context, index) => const Divider(
                indent: 16,
                thickness: 1,
                height: 1,
              ),
              itemCount: options.length,
            ),
          ],
        ),
      );
}
