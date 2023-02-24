import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
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
          SizedBox(
            height: widget.options.length * 54,
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
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
                        selected: -1,
                        name: widget.options[index].name,
                        items: widget.options[index].items,
                      ),
                    ).then(
                      (value) {},
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.options[index].name,
                        style: const TextStyle(
                          color: black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (index % 2 == 0)
                        WCheckBox(
                          isChecked: false,
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
              separatorBuilder: (context, index) => const Divider(
                indent: 16,
                height: 0,
              ),
              itemCount: widget.options.length,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            margin: const EdgeInsets.only(left: 16),
            height: 1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context)
                  .extension<ThemedColors>()
                  ?.solitude2ToNightRider,
            ),
          ),
        ],
      );
}
