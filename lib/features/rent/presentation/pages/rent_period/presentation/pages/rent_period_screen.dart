import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/rent/domain/entities/rent_list_entity.dart';
import 'package:auto/features/rent/presentation/pages/map_screen/presentation/pages/map_screen.dart';
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
    _startDate = DateFormat('d.MM.y').format(today).toString();
    _endDate = DateFormat('d.MM.y')
        .format(today.add(const Duration(days: 3)))
        .toString();
    for (var i = 0; i <= 23; i++) {
      if (i.toString().length == 2) {
        list
          ..add('$i : 00')
          ..add('$i : 30');
      } else {
        list
          ..add('0$i : 00')
          ..add('0$i : 30');
      }
    }
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
                  textStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .darkToWhite),
                  disabledDatesTextStyle: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .ghostToGreySuit),
                  todayTextStyle: Theme.of(context)
                      .textTheme
                      .subtitle1!
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
                    .headline3!
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
                    .headline3!
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
                        style: Theme.of(context).textTheme.headline1!.copyWith(
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
                                .headline1!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 13),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                      child: Text(
                        LocaleKeys.end.tr(),
                        style: Theme.of(context).textTheme.headline1!.copyWith(
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
                                .headline1!
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
          onTap: () => Navigator.push(context,
              fade(page: MapScreen(rentListEntity: widget.rentListEntity))),
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

  void getLengthOfSlider() {
    subtraction = (maxValue - minValue).floor();
    sliderLength =
        (MediaQuery.of(context).size.width - (sliderPadding * 2)).floor();
    currentPosition = (sliderLength / subtraction).floor();
  }

  late int subtraction;
  late int sliderLength;
  late int currentPosition;

  void _onSelectionChanged(
      DateRangePickerSelectionChangedArgs dateRangePickerSelectionChangedArgs) {
    setState(() {
      _startDate = DateFormat('d.MM.y')
          .format(dateRangePickerSelectionChangedArgs.value.startDate)
          .toString();
      _endDate = DateFormat('d.MM.y')
          .format(dateRangePickerSelectionChangedArgs.value.endDate ??
              dateRangePickerSelectionChangedArgs.value.startDate)
          .toString();
    });
  }

  double sliderPadding = 12;
  double maxValue = 47;
  double minValue = 0;
  double hour = 0;
  double endHour = 0;
}
