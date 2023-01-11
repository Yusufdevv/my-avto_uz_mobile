import 'package:auto/assets/colors/color.dart';
import 'package:auto/core/utils/size_config.dart';
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
  final bool isProfileEdit;
  final bool isOtherPage;
  Map<int, Region> checkedRegions;

  RentChooseRegionBottomSheet({
    required this.list,
    this.isProfileEdit = false,
    this.isOtherPage = false,
    this.checkedRegions = const <int, Region>{},
    super.key,
  }) : super();

  @override
  State<RentChooseRegionBottomSheet> createState() =>
      _RentChooseRegionBottomSheetState();
}

class _RentChooseRegionBottomSheetState
    extends State<RentChooseRegionBottomSheet> {
  Map<int, Region> checkStatus = <int, Region>{};
  @override
  void initState() {
    checkStatus =
        widget.checkedRegions.map((key, value) => MapEntry(value.id, value));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('=>=>=>=> ${widget.list} <=<=<=<=');
    final isAllChecked = checkStatus.length == widget.list.length;
    return Container(
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
                Navigator.of(context)
                    .pop(checkStatus.entries.map((e) => e.value).toList());
              }),
          const Divider(thickness: 1, color: border, height: 1),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  if (!widget.isProfileEdit)
                    RegionSelectAllItem(
                      isAllChecked: isAllChecked,
                      isOtherPage: widget.isOtherPage,
                      onTap: () {
                        if (isAllChecked) {
                          checkStatus = {};
                        } else {
                          for (var i = 0; i < widget.list.length; i++) {
                            checkStatus[widget.list[i].id] = widget.list[i];
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
                            if (widget.isProfileEdit) {
                              checkStatus
                                  .removeWhere((key, value) => key != index);
                              checkStatus[index] = widget.list[index];
                            } else {
                              if (checkStatus
                                  .containsKey(widget.list[index].id)) {
                                checkStatus.remove(widget.list[index].id);
                              } else {
                                checkStatus[widget.list[index].id] =
                                    widget.list[index];
                              }
                            }
                            setState(() {});
                          },
                          child: RegionSheetItem(
                            isOtherPage: widget.isOtherPage,
                            isProfileEdit: widget.isProfileEdit,
                            title: widget.list[index].title,
                            hasBorder: index == widget.list.length - 1,
                            isChecked:
                                checkStatus.containsKey(widget.list[index].id),
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
