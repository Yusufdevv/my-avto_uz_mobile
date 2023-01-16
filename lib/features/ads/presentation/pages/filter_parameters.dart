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
  final bool? ischek;
  final AnnouncementListBloc? bloc;
  const FilterParameters(
      {super.key,
      this.bodyType,
      this.carDriveType,
      this.gearboxType,
      this.yearValues,
      this.priceValues,
      this.bloc,
      this.idVal,
      this.ischek});

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
      ischek: widget.ischek ?? false,
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
                    onPressed: () {
                      widget.bloc!
                          .add(AnnouncementListEvent.getInfo(isFilter: false));
                      widget.bloc!.add(AnnouncementListEvent.getFilterClear());
                      widget.bloc!
                          .add(AnnouncementListEvent.getAnnouncementList());
                      filterBloc.add(FilterClearEvent());
                    },
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
              body: Padding(
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
                      hintText: state.bodyType?.type == null
                          ? LocaleKeys.choose_body.tr()
                          : state.bodyType!.type.isEmpty
                              ? LocaleKeys.choose_body.tr()
                              : state.bodyType!.type,
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
                      hintText: state.carDriveType?.type == null
                          ? LocaleKeys.choose_body.tr()
                          : state.carDriveType!.type.isEmpty
                              ? LocaleKeys.choose_drive_type.tr()
                              : state.carDriveType!.type,
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
                      hintText: state.gearboxType?.type == null
                          ? LocaleKeys.choose_body.tr()
                          : state.gearboxType!.type.isEmpty
                              ? LocaleKeys.choose_box_type.tr()
                              : state.gearboxType!.type,
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
                    const Spacer(),
                    WButton(
                      onTap: () {
                        widget.bloc!.add(AnnouncementListEvent.getFilter(
                            widget.bloc!.state.filter.copyWith(
                          bodyType: state.bodyType?.id,
                          driveType: state.carDriveType?.id,
                          gearboxType: state.gearboxType?.id == -1
                              ? null
                              : state.gearboxType?.id,
                        )));
                        widget.bloc!
                            .add(AnnouncementListEvent.getAnnouncementList());
                        widget.bloc!.add(
                          AnnouncementListEvent.getInfo(
                            bodyType: state.bodyType,
                            gearboxType: state.gearboxType,
                            carDriveType: state.carDriveType,
                            yearValues: state.yearValues,
                            priceValues: state.priceValues,
                            idVal: state.idVal,
                            isFilter: state.ischeck,
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
