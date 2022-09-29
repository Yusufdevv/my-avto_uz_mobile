import 'package:auto/assets/colors/color.dart';
import 'package:flutter/material.dart';

class CharacteristicBox extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  const CharacteristicBox({required this.color, required this.title,required this.value, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    color: color,
    //height: 52,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    width: 180,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(fontWeight: FontWeight.w400, fontSize: 11,color: grey),
        ),
        const SizedBox(height: 3,),
        Text(
         value,
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
        ),

      ],
    ),
  );
}
