

import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/range_slider.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/comparison/presentation/bloc/filter_parameters_bloc/bloc/filter_parameters_bloc.dart';
import 'package:auto/features/rent/presentation/bloc/rent_bloc/rent_bloc.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/choose_body_type.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/choose_drive_type.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/choose_gearbox.dart';
import 'package:auto/features/search/presentation/widgets/selector_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterParameters extends StatefulWidget {
  final FilterParametersBloc filterParametersBloc;
  final RentBloc rentBloc;

  const FilterParameters({
    super.key,
    required this.filterParametersBloc,
    required this.rentBloc,
  });

  @override
  State<FilterParameters> createState() => _FilterParametersState();
}

class _FilterParametersState extends State<FilterParameters> {
  RangeValues yearValues = RangeValues(1960, DateTime.now().year + 0);

  RangeValues priceValues = const RangeValues(1000, 500000);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<FilterParametersBloc, FilterParametersState>(
        bloc: widget.filterParametersBloc,
        builder: (context, state) {
          var size = MediaQuery.of(context).size;
          return Scaffold(
            appBar: WAppBar(
              title: 'Параметры',
              centerTitle: false,
              extraActions: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Сбросить',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: orange,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectorItem(
                    onTap: () async {
                      await showModalBottomSheet(
                        isDismissible: false,
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (c) => const ChooseBodyType(
                          selectedId: 0,
                        ),
                      ).then((value) {
                        // widget.rentBloc.add(RentSetParamFromFilterEvent(
                        //     carBodyTypeId: value?[0].toString()));
                      });
                    },
                    hintText: LocaleKeys.choose_body.tr(),
                    title: LocaleKeys.body_type.tr(),
                    hasArrowDown: true,
                  ),
                  SelectorItem(
                    onTap: () async {
                      await showModalBottomSheet(
                        isDismissible: false,
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (c) => const ChooseBodyType(selectedId: 0),
                      ).then((value) {
                        // widget.rentBloc.add(RentSetParamFromFilterEvent(
                        //     carBodyTypeId: value?[0].toString()));
                      });
                    },
                    hintText: LocaleKeys.choose_class.tr(),
                    title: LocaleKeys.classs.tr(),
                    hasArrowDown: true,
                  ),
                  SelectorItem(
                    onTap: () async {
                      await showModalBottomSheet(
                        isDismissible: false,
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (c) => const ChooseDriveType(selectedId: 0),
                      ).then((value) {
                        // widget.rentBloc.add(
                        //     RentSetParamFromFilterEvent(carDriveTypeId: value));
                      });
                    },
                    hintText: LocaleKeys.choose_drive_type.tr(),
                    title: LocaleKeys.drive_unit.tr(),
                    hasArrowDown: true,
                  ),
                  SelectorItem(
                    onTap: () async {
                      await showModalBottomSheet(
                        isDismissible: false,
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (c) => const ChooseGearbox(selectedId: 0),
                      ).then((value) {
                        // widget.rentBloc.add(
                        //     RentSetParamFromFilterEvent(gearboxTypeId: value));
                      });
                    },
                    hintText: LocaleKeys.choose_box_type.tr(),
                    title: LocaleKeys.box.tr(),
                    hasArrowDown: true,
                  ),
                  Text(
                    'Выберите валюту',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WButton(
                        onTap: () {
                          widget.filterParametersBloc
                              .add(FilterParametersEvent.getIdVal(0));
                        },
                        height: 36,
                        width: MediaQuery.of(context).size.width * 0.45,
                        color: state.idVal == 0 ? lavender : whiteSmoke,
                        borderRadius: 46,
                        border:
                            state.idVal == 0 ? Border.all(color: purple) : null,
                        child: Text(
                          'у.е. ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: state.idVal == 0 ? dark : grey,
                          ),
                        ),
                      ),
                      WButton(
                        onTap: () {
                          widget.filterParametersBloc
                              .add(FilterParametersEvent.getIdVal(1));
                        },
                        height: 36,
                        width: MediaQuery.of(context).size.width * 0.45,
                        color: state.idVal == 1 ? lavender : whiteSmoke,
                        borderRadius: 46,
                        border:
                            state.idVal == 1 ? Border.all(color: purple) : null,
                        child: Text(
                          'сум',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: state.idVal == 1 ? dark : grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  WRangeSlider(
                    values: yearValues,
                    valueChanged: (value) {
                      yearValues = value;
                      setState(() {});
                    },
                    title: LocaleKeys.year_of_issue.tr(),
                    endValue: DateTime.now().year + 0,
                    startValue: 1960,
                  ),
                  const SizedBox(height: 16),
                  WRangeSlider(
                    values: priceValues,
                    valueChanged: (value) {
                      priceValues = value;
                      setState(() {});
                    },
                    title: LocaleKeys.price.tr(),
                    endValue: 500000,
                    startValue: 1000,
                    isForPrice: true,
                  ),
                  SizedBox(height: size.height * 0.1),
                  WButton(
                    onTap: () => Navigator.pop(context),
                    text: 'Показать',
                  ),
                ],
              ),
            ),
          );
        },
      );
}
