import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/common/bloc/regions/regions_bloc.dart';
import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/common/widgets/range_slider.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/rent/presentation/bloc/rent_bloc/rent_bloc.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/choose_body_type.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/choose_drive_type.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/choose_gearbox.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/choose_maker.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/rent_choose_region_bottom_sheet.dart';
import 'package:auto/features/search/presentation/widgets/selector_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RentFilterScreen extends StatefulWidget {
  final RentBloc rentBloc;
  const RentFilterScreen({
    required this.rentBloc,
    Key? key,
  }) : super(key: key);

  @override
  State<RentFilterScreen> createState() => _RentFilterScreenState();
}

class _RentFilterScreenState extends State<RentFilterScreen> {
  RangeValues yearValues = RangeValues(1960, DateTime.now().year + 0);
  RangeValues priceValues = const RangeValues(1000, 500000);
  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: widget.rentBloc,
        child: BlocBuilder<RentBloc, RentState>(
          builder: (context, state) => Scaffold(
            appBar: WAppBar(
              boxShadow: const [],
              extraActions: [
                Text(LocaleKeys.filter.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
                const Spacer(flex: 30),
                WScaleAnimation(
                  onTap: () => widget.rentBloc.add(RentCleanFilterEvent()),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      LocaleKeys.clear.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: blue),
                    ),
                  ),
                )
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
                      await showModalBottomSheet<List<Region>>(
                        isDismissible: false,
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (c) => RentChooseRegionBottomSheet(
                            list: context.read<RegionsBloc>().state.regions),
                      ).then((value) {
                        widget.rentBloc
                            .add(RentSetParamFromFilterEvent(regions: value));
                      });
                    },
                    hintText: (state.regions?.isEmpty ?? true)
                        ? LocaleKeys.choose_region.tr()
                        : state.regions!.first.title,
                    title: LocaleKeys.region.tr(),
                    hasArrowDown: true,
                  ),
                  SelectorItem(
                    onTap: () async {
                      await showModalBottomSheet<MakeEntity>(
                        isDismissible: false,
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (c) => const ChooseMaker(selectedId: -1),
                      ).then((value) {
                        print('===6=6=6=6=6> ${value.runtimeType.toString()}');
                        print(value);
                        widget.rentBloc
                            .add(RentSetParamFromFilterEvent(maker: value));
                      });
                    },
                    hintText: state.maker?.name ?? LocaleKeys.choose_brand.tr(),
                    title: LocaleKeys.brand.tr(),
                    hasArrowDown: true,
                  ),
                  SelectorItem(
                    onTap: () async {
                      await showModalBottomSheet<String>(
                        isDismissible: false,
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (c) => const ChooseBodyType(),
                      ).then((value) {
                        widget.rentBloc.add(
                            RentSetParamFromFilterEvent(carBodyTypeId: value));
                      });
                    },
                    hintText: LocaleKeys.choose_body.tr(),
                    title: LocaleKeys.body_type.tr(),
                    hasArrowDown: true,
                  ),
                  SelectorItem(
                    onTap: () async {
                      await showModalBottomSheet<String>(
                        isDismissible: false,
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (c) => const ChooseDriveType(),
                      ).then((value) {
                        widget.rentBloc.add(
                            RentSetParamFromFilterEvent(carDriveTypeId: value));
                      });
                    },
                    hintText: LocaleKeys.choose_drive_type.tr(),
                    title: LocaleKeys.drive_unit.tr(),
                    hasArrowDown: true,
                  ),
                  SelectorItem(
                    onTap: () async {
                      await showModalBottomSheet<String>(
                        isDismissible: false,
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (c) => const ChooseGearbox(),
                      ).then((value) {
                        widget.rentBloc.add(
                            RentSetParamFromFilterEvent(gearboxTypeId: value));
                      });
                    },
                    hintText: LocaleKeys.choose_box_type.tr(),
                    title: LocaleKeys.box.tr(),
                    hasArrowDown: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
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
                  const SizedBox(height: 16),
                  WButton(
                    onTap: () {
                      widget.rentBloc.add(
                        RentSetParamFromFilterEvent(
                          yearEnd: yearValues.end.floor().toString(),
                          yearStart: yearValues.start.floor().toString(),
                          priceEnd: priceValues.end.floor(),
                          priceStart: priceValues.start.floor(),
                        ),
                      );
                      Navigator.pop(context);
                    },
                    text: LocaleKeys.apply.tr(),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
