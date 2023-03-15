import 'package:auto/assets/colors/color.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ads/presentation/pages/filter_parameters.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/rent/domain/usecases/get_body_types_usecase.dart';
import 'package:auto/features/rent/presentation/bloc/get_body_types/get_body_types_bloc.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/maker_sheet_item.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/sheet_header.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

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
        decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.vertical(
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
            const Divider(thickness: 1, color: border, height: 1),
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
