import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/material.dart';

class WRangeSlider extends StatefulWidget {
  final String title;
  final String description;
  final double startValue;
  final double endValue;
  final bool isForPrice;
  final RangeValues values;
  final ValueChanged<RangeValues> valueChanged;

  const WRangeSlider({
    required this.title,
    required this.values,
    required this.valueChanged,
    required this.endValue,
    required this.startValue,
    this.description = '',
    this.isForPrice = false,
    Key? key,
  }) : super(key: key);

  @override
  State<WRangeSlider> createState() => _WRangeSliderState();
}

class _WRangeSliderState extends State<WRangeSlider> {
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.isForPrice)
            RichText(
              text: TextSpan(
                text: widget.title,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontWeight: FontWeight.w400),
                children: [
                  TextSpan(
                    text: ' (${widget.description})',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
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
                  .displayMedium!
                  .copyWith(fontWeight: FontWeight.w400),
            ),
          const SizedBox(height: 12),
          SizedBox(
            height: 20,
            width: double.infinity,
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(thumbColor: white),
              child: RangeSlider(
                divisions: 5000,
                min: widget.startValue,
                max: widget.endValue,
                activeColor: purple,
                inactiveColor: grey,
                values: widget.values,
                onChanged: widget.valueChanged,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    widget.isForPrice
                        ? '${MyFunctions.getFormatCost(widget.values.start.toInt().toString())} ${widget.description}'
                        : widget.values.start.toInt().toString(),
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontWeight: FontWeight.w600, color: grey92929D)),
                Text(
                    widget.isForPrice
                        ? '${MyFunctions.getFormatCost(widget.values.end.toInt().toString())} ${widget.description}'
                        : widget.values.end.toInt().toString(),
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontWeight: FontWeight.w600, color: grey92929D)),
              ],
            ),
          ),
        ],
      );
}
