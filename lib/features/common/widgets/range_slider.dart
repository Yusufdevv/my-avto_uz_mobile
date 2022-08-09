import 'package:auto/assets/colors/color.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/material.dart';

class WRangeSlider extends StatefulWidget {
  final String title;
  final double startValue;
  final double endValue;
  final String sliderStatus;

  const WRangeSlider(
      {required this.title,
      required this.endValue,
      required this.sliderStatus,
      required this.startValue,
      Key? key})
      : super(key: key);

  @override
  State<WRangeSlider> createState() => _WRangeSliderState();
}

class _WRangeSliderState extends State<WRangeSlider> {
  RangeValues values = const RangeValues(1960, 2022);
  int year = 0;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.sliderStatus == 'price')
            RichText(
              text: TextSpan(
                text: widget.title,
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontWeight: FontWeight.w600),
                children: [
                  TextSpan(
                    text: ' (USD)',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                ],
              ),
            )
          else
            Text(
              widget.title,
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 20,
            width: double.infinity,
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(thumbColor: red),
              child: RangeSlider(
                  divisions: 100,
                  min: widget.startValue,
                  max: widget.endValue,
                  activeColor: purple,
                  inactiveColor: red,
                  values: values,
                  onChanged: (value) {
                    setState(() {
                      values = value;
                    });
                  }),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    widget.sliderStatus == 'price'
                        ? '${MyFunctions.getFormatCost(values.start.toInt().toString())} \$'
                        : values.start.toInt().toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontWeight: FontWeight.w600)),
                Text(
                    widget.sliderStatus == 'price'
                        ? '${MyFunctions.getFormatCost(values.end.toInt().toString())} \$'
                        : values.end.toInt().toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      );
}
