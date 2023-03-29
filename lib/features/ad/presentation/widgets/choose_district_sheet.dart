import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
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
        margin: const EdgeInsets.only(top: 48),
        decoration:  BoxDecoration(
          color: Theme.of(context)
              .extension<ThemedColors>()!
              .whiteToDark,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            SheetHeader(
                title: LocaleKeys.region.tr(),
                onCancelPressed: () {
                  Navigator.of(context).pop();
                }),
             Divider(thickness: 1, color: Theme.of(context)
                .extension<ThemedColors>()!
                .divider, height: 1),
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
                              isMultiChoice: false,
                              title: widget.districts[index].title,
                              hasBorder: index == widget.districts.length - 1,
                              isChecked: widget.districts[index].id == selected,
                            ),
                          ),
                           Divider(
                            thickness: 1,
                            color: Theme.of(context)
                                .extension<ThemedColors>()!
                                .divider,
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
                    try {
                      Navigator.of(context).pop(
                          widget.districts.firstWhere((e) => e.id == selected));
                      // ignore: avoid_catches_without_on_clauses
                    } catch (e) {
                      Navigator.of(context).pop(null);
                    }
                  },
                  color: orange,
                  text: 'Применить'),
            ),
          ],
        ),
      );
}
