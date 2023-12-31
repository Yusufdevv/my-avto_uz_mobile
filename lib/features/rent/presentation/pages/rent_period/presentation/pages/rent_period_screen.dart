import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/rent/domain/entities/register_lease_entity.dart';
import 'package:auto/features/rent/domain/entities/rent_list_entity.dart';
import 'package:auto/features/rent/presentation/pages/confimation/presentation/pages/confirmation_screen.dart';
import 'package:auto/features/rent/presentation/pages/rent_period/presentation/widgets/period_header.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class RentPeriodScreen extends StatefulWidget {
  final RentListEntity rentListEntity;
  const RentPeriodScreen({required this.rentListEntity, Key? key})
      : super(key: key);

  @override
  State<RentPeriodScreen> createState() => _RentPeriodScreenState();
}

class _RentPeriodScreenState extends State<RentPeriodScreen> {
  late String _startDate, _endDate;
  late DateRangePickerController _controller;
  final DateTime dateTime = DateTime.now();

  @override
  void initState() {
    _controller = DateRangePickerController();
    final today = DateTime.now();
    startDateForLease = DateFormat('yyyy-MM-dd').format(today).toString();
    _startDate = DateFormat('d.MM.y').format(today).toString();
    _endDate = DateFormat('d.MM.y')
        .format(today.add(const Duration(days: 3)))
        .toString();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    getLengthOfSlider();

    super.didChangeDependencies();
  }

  late List<String> list = [];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: WAppBar(
          title: LocaleKeys.rent_period.tr(),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              PeriodHeader(
                onTap: () {
                  dateToApi(startDateForLease, list[hour.floor()]);
                },
                endDate: _endDate,
                startDate: _startDate,
                startHour: list[hour.floor()],
                endHour: list[endHour.floor()],
              ),
              SfDateRangePicker(
                monthViewSettings: const DateRangePickerMonthViewSettings(
                  firstDayOfWeek: 1,
                ),
                selectionMode: DateRangePickerSelectionMode.range,
                todayHighlightColor: Colors.transparent,
                selectionRadius: 30,
                enablePastDates: false,
                initialSelectedRange:
                    PickerDateRange(DateTime.now(), DateTime.now()),
                monthCellStyle: DateRangePickerMonthCellStyle(
                  textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .darkToWhite),
                  disabledDatesTextStyle: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .ghostToGreySuit),
                  todayTextStyle: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .darkToWhite),
                ),
                headerStyle: const DateRangePickerHeaderStyle(
                    textAlign: TextAlign.center),
                selectionColor: purple,
                selectionTextStyle: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                selectionShape: DateRangePickerSelectionShape.rectangle,
                rangeSelectionColor: Theme.of(context)
                    .extension<ThemedColors>()!
                    .ghostWhite1ToNero,
                startRangeSelectionColor: Theme.of(context)
                    .extension<ThemedColors>()!
                    .lavenderBlueToCharcoal,
                endRangeSelectionColor: Theme.of(context)
                    .extension<ThemedColors>()!
                    .lavenderBlueToCharcoal,
                rangeTextStyle: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                onSelectionChanged: _onSelectionChanged,
                controller: _controller,
              ),
              Container(
                color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                      child: Text(
                        LocaleKeys.start.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                                fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(sliderPadding),
                          child: SliderTheme(
                            data: SliderThemeData(
                                //valueIndicatorShape: RectangularSliderValueIndicatorShape(),
                                overlayShape: SliderComponentShape.noOverlay),
                            child: Slider(
                              value: hour,
                              max: maxValue,
                              label: hour.toString(),
                              min: minValue,
                              activeColor: purple,
                              inactiveColor: Theme.of(context)
                                  .extension<ThemedColors>()!
                                  .silverToNightRider,
                              onChanged: (value) {
                                setState(() {
                                  hour = value;
                                });
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          left: sliderLength / sliderPadding / currentPosition -
                              hour +
                              sliderPadding +
                              (currentPosition * hour).floorToDouble() -
                              sliderPadding,
                          // right: sliderLength - (currentPosition * hour).floorToDouble()-36 ,
                          bottom: -5,
                          child: Text(
                            list[hour.floor()],
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 13),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                      child: Text(
                        LocaleKeys.end.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                                fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(sliderPadding),
                          child: SliderTheme(
                            data: SliderThemeData(
                                overlayShape: SliderComponentShape.noOverlay),
                            child: Slider(
                              value: endHour,
                              max: maxValue,
                              activeColor: purple,
                              inactiveColor: Theme.of(context)
                                  .extension<ThemedColors>()!
                                  .silverToNightRider,
                              label: hour.toString(),
                              min: minValue,
                              onChanged: (value) {
                                setState(() {
                                  endHour = value;
                                });
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          left: sliderLength / sliderPadding / currentPosition -
                              endHour +
                              sliderPadding +
                              (currentPosition * endHour).floorToDouble() -
                              sliderPadding,
                          //right: sliderLength - (currentPosition * hour).floorToDouble()-36 ,
                          bottom: -5,
                          child: Text(
                            list[endHour.floor()],
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 13),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
        bottomNavigationBar: WButton(
          height: 44,
          onTap: () => Navigator.push(
            context,
            fade(
              page: ConfirmationScreen(
                lease: RegisterLeaseEntity(
                  startDate:
                      dateToApi(startDateForLease, list[hour.floor()]) ?? '0',
                  endDate: dateToApi(endDateForLease, list[hour.floor()]) ??
                      dateToApi(startDateForLease, list[hour.floor()]) ??
                      '0',
                  rent: widget.rentListEntity.id,
                ),
                receivingAddress: 'receiving address',
                returningAddress: 'returning address',
                rentListEntity: widget.rentListEntity,
                fromDate: '$_startDate, ${list[hour.floor()]}',
                toDate: '$_endDate, ${list[endHour.floor()]}',
              ),
            ),
          ),
          margin: EdgeInsets.fromLTRB(
              16, 0, 16, MediaQuery.of(context).padding.bottom + 16),
          text: LocaleKeys.further.tr(),
          shadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 20,
                color: orange.withOpacity(0.2)),
          ],
        ),
      );

  String? dateToApi(String? d, String? h) {
    if (d == null || h == null) return null;
    final l = h.split(':');
    final hh = int.tryParse(l[0]) ?? 0;

    return '${d}T$hh:${l[1].trim()}:00.000Z';
  }

  void getLengthOfSlider() {
    subtraction = (maxValue - minValue).floor();
    sliderLength =
        (MediaQuery.of(context).size.width - (sliderPadding * 2)).floor();
    currentPosition = (sliderLength / subtraction).floor();
  }

  late int subtraction;
  late int sliderLength;
  late int currentPosition;
  late String startDateForLease;
  String? endDateForLease;

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs dRPSChArgs) {
    setState(() {
      _startDate =
          DateFormat('d.MM.y').format(dRPSChArgs.value.startDate).toString();
      _endDate = DateFormat('d.MM.y')
          .format(dRPSChArgs.value.endDate ?? dRPSChArgs.value.startDate)
          .toString();
      startDateForLease = DateFormat('yyyy-MM-dd')
          .format(dRPSChArgs.value.startDate)
          .toString();
      endDateForLease = DateFormat('yyyy-MM-dd')
          .format(dRPSChArgs.value.endDate ?? dRPSChArgs.value.startDate)
          .toString();
    });
  }

  double sliderPadding = 12;
  double maxValue = 47;
  double minValue = 0;
  double hour = 0;
  double endHour = 0;
}
