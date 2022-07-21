import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/thumb_shape.dart';
import 'package:flutter/material.dart';

class WRangeSlider extends StatefulWidget {
  const WRangeSlider({Key? key}) : super(key: key);

  @override
  State<WRangeSlider> createState() => _WRangeSliderState();
}

class _WRangeSliderState extends State<WRangeSlider> {
  RangeValues values = const RangeValues(1960, 1961);
  int year = 0;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
          width: double.infinity,
          child: SliderTheme(
            data: SliderThemeData(),
            child: RangeSlider(
                divisions: 100,
                min: 1960,
                max: 2022,
                activeColor: purple,
                inactiveColor: red,
                values: values,
                labels: RangeLabels('${values.start.toInt()}', '${values.end.toInt()}'),
                onChanged: (value){
                  print('START: ${value.start.toInt().toString()}, End: ${value.end.toInt().toString()}');
                  setState(() {
                    values =value;
                  });
                }
            ),
          ),
        ),
        const SizedBox(height: 6,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(values.start.toInt().toString()),
              Text(values.end.toInt().toString()),
            ],
          ),
        )
      ],
    ),
  );
}
/* RangeSlider(
                divisions: 100,
                activeColor: purple,
                inactiveColor: purple,
                min: 1960,
                max: 2022,
                values: values,
                labels: RangeLabels('${values.start.toInt()}', '${values.end.toInt()}'),
                onChanged: (value){
                  print('START: ${value.start.toInt().toString()}, End: ${value.end.toInt().toString()}');
                  setState(() {
                    values =value;
                  });
                }
            ),*/