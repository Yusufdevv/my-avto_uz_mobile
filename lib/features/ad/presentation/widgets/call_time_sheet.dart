import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/presentation/widgets/hour_picker_widget.dart';
import 'package:auto/features/car_single/presentation/widgets/orange_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CallTimeSheet extends StatefulWidget {
  final String timeFrom;
  final String timeTo;

  const CallTimeSheet({
    required this.timeFrom,
    required this.timeTo,
    Key? key,
  }) : super(key: key);

  @override
  State<CallTimeSheet> createState() => _CallTimeSheetState();
}

class _CallTimeSheetState extends State<CallTimeSheet> {
  late String from;
  late String to;
  @override
  void initState() {
    from = widget.timeFrom;
    to = widget.timeTo;

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.only(
          top: 20,
          right: 16,
          left: 16,
          bottom: MediaQuery.of(context).padding.bottom + 42,
        ),
        decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.choose_time.tr(),
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Transform.scale(
                    scale: .8,
                    child: SvgPicture.asset(
                      AppIcons.close,
                      width: 32,
                      height: 32,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 27),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HourPickerWidget(
                      defaultHour: 8,
                      initialItem: widget.timeFrom,
                      title: LocaleKeys.from.tr(),
                      onChanged: (value) => setState(() => from = value)),
                  Container(width: 1, height: 120, color: border),
                  HourPickerWidget(
                      defaultHour: 17,
                      initialItem: widget.timeTo,
                      title: LocaleKeys.to.tr(),
                      onChanged: (value) => setState(() => to = value)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            OrangeButton(
              shadowColor: orange.withOpacity(0.2),
              color: orange,
              onTap: () {
                if (from.isEmpty) from = '08 : 00';
                if (to.isEmpty) to = '17 : 00';
                Navigator.of(context).pop([from, to]);
              },
              content: Text(
                LocaleKeys.confirm.tr(),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: white,
                    ),
              ),
            ),
          ],
        ),
      );
}
