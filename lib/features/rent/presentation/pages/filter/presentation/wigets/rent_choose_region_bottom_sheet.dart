import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/region_sheet_all_select_item.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/region_sheet_item.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/sheet_header.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RentChooseRegionBottomSheet extends StatefulWidget {
  final List<Region> list;

  const RentChooseRegionBottomSheet({required this.list, super.key}) : super();

  @override
  State<RentChooseRegionBottomSheet> createState() =>
      _RentChooseRegionBottomSheetState();
}

class _RentChooseRegionBottomSheetState
    extends State<RentChooseRegionBottomSheet> {
  Map<int, Region> checkStatus = {};

  @override
  Widget build(BuildContext context) {
    final isAllChecked = checkStatus.length == widget.list.length;
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 44),
      decoration: const BoxDecoration(
        color: white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          SheetHeader(
              title: LocaleKeys.region.tr(),
              onCancelPressed: () {
                Navigator.of(context)
                    .pop(checkStatus.entries.map((e) => e.value).toList());
              }),
          const Divider(thickness: 1, color: border, height: 1),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  RegionSelectAllItem(
                    isAllChecked: isAllChecked,
                    onTap: () {
                      if (isAllChecked) {
                        checkStatus = {};
                      } else {
                        for (var i = 0; i < widget.list.length; i++) {
                          checkStatus[i] = widget.list[i];
                        }
                      }
                      setState(() {});
                    },
                  ),
                  ...List.generate(
                    widget.list.length,
                    (index) => Column(
                      children: [
                        WScaleAnimation(
                          onTap: () {
                            if (checkStatus.containsKey(index)) {
                              checkStatus.remove(index);
                            } else {
                              checkStatus[index] = widget.list[index];
                            }
                            setState(() {});
                          },
                          child: RegionSheetItem(
                            title: widget.list[index].title,
                            hasBorder: index == widget.list.length - 1,
                            isChecked: checkStatus.containsKey(index),
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
              bottom: 50,
            ),
            child: WButton(
                onTap: () {
                  Navigator.of(context)
                      .pop(checkStatus.entries.map((e) => e.value).toList());
                },
                color: orange,
                text: 'Применить'),
          ),
        ],
      ),
    );
  }
}
