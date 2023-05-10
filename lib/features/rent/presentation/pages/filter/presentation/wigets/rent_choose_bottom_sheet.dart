import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/maker_sheet_item.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/marks_sheet_all_select_item.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/sheet_header.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ToChoose {
  final String title;
  final String imagePath;
  final int id;

  ToChoose({
    required this.title,
    required this.imagePath,
    required this.id,
  });
}

class RentChooseBottomSheet extends StatefulWidget {
  final String title;
  final List<ToChoose> list;

  const RentChooseBottomSheet(
      {required this.title, required this.list, super.key})
      : super();

  @override
  State<RentChooseBottomSheet> createState() => _RentChooseBottomSheetState();
}

class _RentChooseBottomSheetState extends State<RentChooseBottomSheet> {
  Map<int, int> checkStatus = {};

  void goBack() {
    Navigator.of(context).pop(checkStatus.entries.map((e) => e.value).toList());
  }

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
          SheetHeader(title: widget.title, onCancelPressed: goBack),
          const Divider(thickness: 1, color: border, height: 1),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SheetSelectAllButton(
                    title: '${LocaleKeys.all.tr()} ${widget.title}',
                    isAllChecked: isAllChecked,
                    onTap: () {
                      if (isAllChecked) {
                        checkStatus = {};
                      } else {
                        for (var i = 0; i < widget.list.length; i++) {
                          checkStatus[i] = widget.list[i].id;
                        }
                      }
                      setState(() {});
                    },
                  ),
                  ...List.generate(
                      widget.list.length,
                      (index) => RentSheetItemm(
                            onTap: () {
                              if (checkStatus.containsKey(index)) {
                                checkStatus.remove(index);
                              } else {
                                checkStatus[index] = widget.list[index].id;
                              }
                              setState(() {});
                            },
                            logo: widget.list[index].imagePath,
                            title: widget.list[index].title,
                            isChecked: checkStatus.containsKey(index),
                            hasDivider: widget.list.length - 1 != index,
                          )),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 50),
            child: WButton(
                onTap: goBack, color: orange, text: LocaleKeys.apply.tr()),
          ),
        ],
      ),
    );
  }
}
