import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/domain/entities/equipment/equipment_option_entity.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/widgets/equipment_option_sheet.dart';
import 'package:auto/features/common/widgets/w_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

typedef OnEquipmentOptionPressed = Function({
  required String type,
  required int id,
  required bool isAdd,
  required String itemName,
  SO? selectOption,
});

typedef IsOptionSelected = bool Function(
    {required String type, required int id});

class EquipmentCategory extends StatelessWidget {
  const EquipmentCategory({
    required this.categoryName,
    required this.options,
    required this.onEquipmentOptionPressed,
    required this.selectOptions,
    required this.isOptionSelected,
    Key? key,
  }) : super(key: key);

  final String categoryName;
  final List<EquipmentOptionEntity> options;
  final OnEquipmentOptionPressed onEquipmentOptionPressed;
  final IsOptionSelected isOptionSelected;
  final Map<int, SO> selectOptions;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            child: Text(
              categoryName,
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
                  showModalBottomSheet<SO>(
                    context: context,
                    useRootNavigator: true,
                    isScrollControlled: true,
                    backgroundColor: Theme.of(context)
                        .extension<ThemedColors>()!
                        .whiteToDark,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    clipBehavior: Clip.hardEdge,
                    builder: (context) => EquipmentOptionSheet(
                      equipmentName: options[index].name,
                      selected: isOptionSelected(
                              type: 'select', id: options[index].id)
                          ? selectOptions[options[index].id]?.id ?? -1
                          : -1,
                      name: options[index].name,
                      items: options[index].items,
                    ),
                  ).then((value) {
                    if (value != null) {
                      onEquipmentOptionPressed(
                        isAdd: true,
                        id: options[index].id,
                        itemName: options[index].name,
                        selectOption: value,
                        type: 'select',
                      );
                    }
                  });
                } else {
                  onEquipmentOptionPressed(
                    itemName: options[index].name,
                    id: options[index].id,
                    type: 'radio',
                    isAdd:
                        !isOptionSelected(type: 'radio', id: options[index].id),
                  );
                }
              },
              child: Container(
                color: isOptionSelected(
                            type: options[index].type, id: options[index].id) ||
                        options[index].type == 'radio'
                    ? Theme.of(context).extension<ThemedColors>()!.whiteToDark
                    : Theme.of(context)
                        .extension<ThemedColors>()!
                        .whiteLilacToWhite4,
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 16, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        isOptionSelected(
                                    type: options[index].type,
                                    id: options[index].id) &&
                                options[index].type == 'select'
                            ? selectOptions[options[index].id]?.optionName ?? ''
                            : options[index].name,
                        style: TextStyle(
                          color: isOptionSelected(
                                      type: options[index].type,
                                      id: options[index].id) ||
                                  options[index].type == 'radio'
                              ? Theme.of(context)
                                  .extension<ThemedColors>()!
                                  .blackToWhite
                              : Theme.of(context)
                                  .extension<ThemedColors>()!
                                  .greySuitToWhite60,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 3,
                      ),
                    ),
                    if (options[index].type == 'radio')
                      WCheckBox(
                        isChecked: isOptionSelected(
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
      );
}
