import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/region_sheet_item.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/sheet_header.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CurrencyChooseSheet extends StatefulWidget {
  final String selected;

  const CurrencyChooseSheet({
    required this.selected,
    super.key,
  }) : super();

  @override
  State<CurrencyChooseSheet> createState() => _CurrencyChooseSheetState();
}

class _CurrencyChooseSheetState extends State<CurrencyChooseSheet> {
  late String selected;
  @override
  void initState() {
    selected = widget.selected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SheetHeader(
                title: LocaleKeys.valyuta.tr(),
                onCancelPressed: () {
                  Navigator.of(context).pop();
                }),
            const Divider(thickness: 1, color: border, height: 1),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  ...List.generate(
                    Currency.values.length - 1,
                    (index) => Column(
                      children: [
                        WScaleAnimation(
                          onTap: () {
                            selected = Currency.values[index].name;
                            setState(() {});
                          },
                          child: RegionSheetItem(
                            isMultiChoice: false,
                            title: Currency.values[index].name == 'uzs'
                                ? LocaleKeys.sum.tr()
                                : 'y.e',
                            hasBorder: index == Currency.values.length - 1,
                            isChecked: selected == Currency.values[index].name,
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
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 16,
              ),
              child: WButton(
                  onTap: () {
                    Navigator.of(context).pop(selected);
                  },
                  color: orange,
                  text: LocaleKeys.apply.tr()),
            ),
          ],
        ),
      );
}
