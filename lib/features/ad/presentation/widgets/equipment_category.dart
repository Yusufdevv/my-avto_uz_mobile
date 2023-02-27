import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/domain/entities/equipment/equipment_option_entity.dart';
import 'package:auto/features/ad/presentation/widgets/equipment_option_sheet.dart';
import 'package:auto/features/common/widgets/w_check_box.dart';
import 'package:flutter/material.dart';
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
  final Function(int index, int? id, String? itemName) onTap;

  @override
  Widget build(BuildContext context) => Column(
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
                      selected: options[index].selectedInfo.isNotEmpty
                          ? options[index].selectedInfo.keys.first
                          : -1,
                      name: options[index].name,
                      items: options[index].items,
                    ),
                  ).then((value) {
                    if (value != null) {
                      onTap(index, value.keys.first, value.values.first);
                    }
                  });
                } else {
                  onTap(index, options[index].id, null);
                }
              },
              child: Container(
                color: options[index].selectedInfo.isNotEmpty ||
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
                        options[index].selectedInfo.isNotEmpty
                            ? options[index].selectedInfo.values.first
                            : options[index].name,
                        style: TextStyle(
                          color: options[index].selectedInfo.isNotEmpty ||
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
                        isChecked: options[index].selected,
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
