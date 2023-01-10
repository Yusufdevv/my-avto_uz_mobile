import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
import 'package:auto/features/common/bloc/announcement_bloc/bloc/announcement_list_bloc.dart';
import 'package:auto/features/common/widgets/range_slider.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/rent/presentation/bloc/filter/filter_bloc.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/choose_body_type.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/choose_drive_type.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/choose_gearbox.dart';
import 'package:auto/features/search/presentation/widgets/selector_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterParameters extends StatefulWidget {
  final BodyTypeEntity? bodyType;
  final DriveTypeEntity? carDriveType;
  final GearboxTypeEntity? gearboxType;
  final int? idVal;
  final RangeValues? yearValues;
  final RangeValues? priceValues;
  final AnnouncementListBloc? bloc;
  const FilterParameters({
    super.key,
    this.bodyType,
    this.carDriveType,
    this.gearboxType,
    this.yearValues,
    this.priceValues,
    this.bloc,
    this.idVal,
  });

  @override
  State<FilterParameters> createState() => _FilterParametersState();
}

class _FilterParametersState extends State<FilterParameters> {
  late FilterBloc filterBloc;

  @override
  void initState() {
    filterBloc = FilterBloc(
      bodyType: widget.bodyType,
      carDriveType: widget.carDriveType,
      gearboxType: widget.gearboxType,
      priceValues: widget.priceValues,
      yearValues: widget.yearValues,
      idVal: widget.idVal,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: filterBloc,
        child: BlocBuilder<FilterBloc, FilterState>(
          builder: (context, state) {
            var size = MediaQuery.of(context).size;
            return Scaffold(
              appBar: WAppBar(
                title: 'Параметры',
                centerTitle: false,
                extraActions: [
                  TextButton(
                    onPressed: () => filterBloc.add(FilterClearEvent()),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectorItem(
                      onTap: () async {
                        await showModalBottomSheet<BodyTypeEntity>(
                          isDismissible: false,
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (c) => ChooseBodyType(
                              selectedId: state.bodyType?.id ?? -1),
                        ).then((value) {
                          filterBloc.add(FilterSelectEvent(bodyType: value));
                        });
                      },
                      hintText:
                          state.bodyType?.type ?? LocaleKeys.choose_body.tr(),
                      title: LocaleKeys.body_type.tr(),
                      hasArrowDown: true,
                    ),
                    SelectorItem(
                      onTap: () async {
                        await showModalBottomSheet<DriveTypeEntity>(
                          isDismissible: false,
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (c) => ChooseDriveType(
                              selectedId: state.carDriveType?.id ?? -1),
                        ).then((value) {
                          filterBloc
                              .add(FilterSelectEvent(carDriveType: value));
                        });
                      },
                      hintText: state.carDriveType?.type ??
                          LocaleKeys.choose_drive_type.tr(),
                      title: LocaleKeys.drive_unit.tr(),
                      hasArrowDown: true,
                    ),
                    SelectorItem(
                      onTap: () async {
                        await showModalBottomSheet<GearboxTypeEntity>(
                          isDismissible: false,
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (c) => ChooseGearbox(
                              selectedId: state.gearboxType?.id ?? -1),
                        ).then((value) {
                          filterBloc.add(FilterSelectEvent(gearboxType: value));
                        });
                      },
                      hintText: state.gearboxType?.type ??
                          LocaleKeys.choose_box_type.tr(),
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
                            filterBloc.add(FilterSelectEvent(idVal: 0));
                          },
                          height: 36,
                          width: MediaQuery.of(context).size.width * 0.45,
                          color: state.idVal == 0 ? lavender : whiteSmoke,
                          borderRadius: 46,
                          border: state.idVal == 0
                              ? Border.all(color: purple)
                              : null,
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
                            filterBloc.add(FilterSelectEvent(idVal: 1));
                          },
                          height: 36,
                          width: MediaQuery.of(context).size.width * 0.45,
                          color: state.idVal == 1 ? lavender : whiteSmoke,
                          borderRadius: 46,
                          border: state.idVal == 1
                              ? Border.all(color: purple)
                              : null,
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
                      values: state.yearValues,
                      valueChanged: (value) =>
                          filterBloc.add(FilterSelectEvent(yearValues: value)),
                      title: LocaleKeys.year_of_issue.tr(),
                      endValue: DateTime.now().year + 0,
                      startValue: 1960,
                    ),
                    const SizedBox(height: 16),
                    WRangeSlider(
                      values: state.priceValues,
                      valueChanged: (value) =>
                          filterBloc.add(FilterSelectEvent(priceValues: value)),
                      title: LocaleKeys.price.tr(),
                      endValue: 500000,
                      startValue: 1000,
                      isForPrice: true,
                    ),
                    SizedBox(height: size.height * 0.2),
                    WButton(
                      onTap: () {
                        widget.bloc!.add(
                          AnnouncementListEvent.getInfo(
                            bodyType: state.bodyType,
                            gearboxType: state.gearboxType,
                            carDriveType: state.carDriveType,
                            yearValues: state.yearValues,
                            priceValues: state.priceValues,
                            idVal: state.idVal,
                          ),
                        );
                        Navigator.of(context).pop();
                      },
                      text: 'Показать',
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
}
