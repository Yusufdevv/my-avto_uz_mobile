import 'package:auto/assets/colors/color.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/ad/domain/entities/district_entity.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/region_sheet_item.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/sheet_header.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChooseDistrictSheet extends StatefulWidget {
  final List<DistrictEntity> districts;
  final int selectedId;

  const ChooseDistrictSheet({
    required this.districts,
    required this.selectedId,
    super.key,
  }) : super();

  @override
  State<ChooseDistrictSheet> createState() => _ChooseDistrictSheetState();
}

class _ChooseDistrictSheetState extends State<ChooseDistrictSheet> {
  int selected = -1;
  @override
  void initState() {
    selected = widget.selectedId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(top: SizeConfig.v(24)),
        decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            SheetHeader(
                title: LocaleKeys.region.tr(),
                onCancelPressed: () {
                  Navigator.of(context).pop();
                }),
            const Divider(thickness: 1, color: border, height: 1),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ...List.generate(
                      widget.districts.length,
                      (index) => Column(
                        children: [
                          WScaleAnimation(
                            onTap: () {
                              selected = widget.districts[index].id;
                              setState(() {});
                            },
                            child: RegionSheetItem(
                              title: widget.districts[index].title,
                              hasBorder: index == widget.districts.length - 1,
                              isChecked: widget.districts[index].id == selected,
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                            color: border,
                            height: 1,
                            indent: 16,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 16,
              ),
              child: WButton(
                  onTap: () {
                    Navigator.of(context).pop(
                        widget.districts.firstWhere((e) => e.id == selected));
                  },
                  color: orange,
                  text: 'Применить'),
            ),
          ],
        ),
      );
}
