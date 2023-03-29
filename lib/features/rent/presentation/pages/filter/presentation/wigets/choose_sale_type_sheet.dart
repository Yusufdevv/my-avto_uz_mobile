import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ads/presentation/pages/filter_parameters.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/maker_sheet_item.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/sheet_header.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChooseSaleTypeSheet extends StatefulWidget {
  final SaleType selected;

  const ChooseSaleTypeSheet({required this.selected, super.key});

  @override
  State<ChooseSaleTypeSheet> createState() => _ChooseSaleTypeSheetState();
}

class _ChooseSaleTypeSheetState extends State<ChooseSaleTypeSheet> {
  late SaleType selected;

  @override
  void initState() {
    selected = widget.selected;

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 44),
        decoration:  BoxDecoration(
          color: Theme.of(context)
              .extension<ThemedColors>()!
              .scaffoldBackground,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            SheetHeader(
                title: LocaleKeys.body.tr(),
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
                  children: SaleType.values
                      .map((e) => RentSheetItemm(
                            hasDivider: e != SaleType.rentWithPurchase,
                            onTap: () {
                              selected = e;
                              setState(() {});
                            },
                            logo: '',
                            title: e.title,
                            isChecked:
                                e == selected || selected == SaleType.all,
                          ))
                      .toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 40),
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
