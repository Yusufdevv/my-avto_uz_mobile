import 'package:auto/assets/colors/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HourPickerWidgetUz extends StatefulWidget {
  final String initialItem;
  final String title;
  final ValueChanged<String> onChanged;
  final int defaultHour;

  const HourPickerWidgetUz({
    required this.onChanged,
    required this.title,
    required this.initialItem,
    required this.defaultHour,
    Key? key,
  }) : super(key: key);

  @override
  State<HourPickerWidgetUz> createState() => _HourPickerWidgetUzState();
}

class _HourPickerWidgetUzState extends State<HourPickerWidgetUz> {
  List<String> values = [];

  late FixedExtentScrollController controller;
  late int currentIndex;

  @override
  void initState() {
    for (var i = 0; i <= 23; i++) {
      if (i.toString().length == 2) {
        values.add('$i : 00');
      } else {
        values.add('0$i : 00');
      }
    }
    final v = values.indexWhere(
        (element) => element.replaceAll(' ', '') == widget.initialItem);
    currentIndex = v > 0 ? v : widget.defaultHour;
    controller = FixedExtentScrollController(initialItem: currentIndex);

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(left: 8),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        height: 120,
        // width: 170,
        child: Row(
          children: [
            SizedBox(
              height: 120,
              width: 95,
              child: CupertinoPicker.builder(
                selectionOverlay: Container(
                  height: 42,
                  width: 60,
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                      color: orange.withOpacity(.1),
                      borderRadius: BorderRadius.circular(8)),
                ),
                childCount: values.length,
                itemBuilder: (context, index) => Text(
                  values[index],
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 19,
                      color: index == currentIndex ? orange : null,
                      fontWeight:
                          index == currentIndex ? FontWeight.w600 : null),
                ),
                diameterRatio: 1.2,
                scrollController: controller,
                magnification: 1.3,
                squeeze: 1.15,
                itemExtent: 35,
                onSelectedItemChanged: (index) {
                  currentIndex = index;
                  setState(() {});
                  widget.onChanged(values[index]);
                },
              ),
            ),
            const SizedBox(width: 8),
            Align(
              alignment: const Alignment(0, -.1),
              child: Text(
                widget.title,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w400, height: 1.3),
              ),
            ),
          ],
        ),
      );
}
