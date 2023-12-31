import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/region_sheet_all_select_item.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/region_sheet_item.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/sheet_header.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RentChooseRegionBottomSheet extends StatefulWidget {
  final List<RegionEntity> list;
  final bool isMultiChoice;
  final Map<int, RegionEntity> checkedRegions;

  const RentChooseRegionBottomSheet({
    required this.list,
    this.isMultiChoice = true,
    this.checkedRegions = const <int, RegionEntity>{},
    super.key,
  }) : super();

  @override
  State<RentChooseRegionBottomSheet> createState() =>
      _RentChooseRegionBottomSheetState();
}

class _RentChooseRegionBottomSheetState
    extends State<RentChooseRegionBottomSheet> {
  Map<int, RegionEntity> checkStatus = <int, RegionEntity>{};

  @override
  void initState() {
    checkStatus =
        widget.checkedRegions.map((key, value) => MapEntry(value.id, value));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isAllChecked = checkStatus.length == widget.list.length;
    return Container(
      margin: const EdgeInsets.only(top: 48),
      decoration: BoxDecoration(
        color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          SheetHeader(
              title: LocaleKeys.region.tr(),
              onCancelPressed: () {
                Navigator.of(context).pop();
              }),
          Divider(
              thickness: 1,
              color: Theme.of(context)
                  .extension<ThemedColors>()!
                  .divider,
              height: 1),
          Expanded(
            child: SingleChildScrollView(
              // physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  if (widget.isMultiChoice)
                    RegionSelectAllItem(
                      isAllChecked: isAllChecked,
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
                            if (!widget.isMultiChoice) {
                              checkStatus.removeWhere(
                                  (key, value) => key != widget.list[index].id);
                              checkStatus[widget.list[index].id] =
                                  widget.list[index];
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
                            isMultiChoice: widget.isMultiChoice,
                            title: widget.list[index].title,
                            hasBorder: index == widget.list.length - 1,
                            isChecked:
                                checkStatus.containsKey(widget.list[index].id),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .solitudeToNightRider,
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
              disabledColor: disabledButton,
              isDisabled: checkStatus.isEmpty,
              onTap: () {
                Navigator.of(context)
                    .pop(checkStatus.entries.map((e) => e.value).toList());
              },
              color: orange,
              text: LocaleKeys.apply.tr(),
            ),
          ),
        ],
      ),
    );
  }
}
