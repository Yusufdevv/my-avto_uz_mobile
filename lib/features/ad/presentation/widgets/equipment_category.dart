import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/domain/entities/equipment/equipment_option_entity.dart';
import 'package:auto/features/ad/presentation/widgets/equipment_option_sheet.dart';
import 'package:auto/features/common/widgets/w_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EquipmentCategory extends StatefulWidget {
  const EquipmentCategory({
    required this.categoryName,
    required this.options,
    Key? key,
  }) : super(key: key);

  final String categoryName;
  final List<EquipmentOptionEntity> options;

  @override
  State<EquipmentCategory> createState() => _EquipmentCategoryState();
}

class _EquipmentCategoryState extends State<EquipmentCategory> {
  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            child: Text(
              widget.categoryName,
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
                if (widget.options[index].type == 'select') {
                  showModalBottomSheet<int>(
                    context: context,
                    useRootNavigator: true,
                    backgroundColor: LightThemeColors.appBarColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    clipBehavior: Clip.hardEdge,
                    builder: (context) => EquipmentOptionSheet(
                      selected: widget.options[index].selectedInfo.isNotEmpty
                          ? widget.options[index].selectedInfo.keys.first
                          : -1,
                      name: widget.options[index].name,
                      items: widget.options[index].items,
                    ),
                  ).then(
                    (value) {},
                  );
                }
              },
              child: Container(
                color: widget.options[index].selectedInfo.isNotEmpty ||
                        widget.options[index].type == 'radio'
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
                        widget.options[index].selectedInfo.isNotEmpty
                            ? widget.options[index].selectedInfo.values.first
                            : widget.options[index].name,
                        style: TextStyle(
                          color:
                              widget.options[index].selectedInfo.isNotEmpty ||
                                      widget.options[index].type == 'radio'
                                  ? black
                                  : grey,
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    if (widget.options[index].type == 'radio')
                      WCheckBox(
                        isChecked: widget.options[index].selected,
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
              height: 0,
            ),
            itemCount: widget.options.length,
          ),
        ],
      );
}
