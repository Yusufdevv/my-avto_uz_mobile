import 'package:auto/assets/colors/color.dart';
import 'package:flutter/material.dart';

class DotAndText extends StatelessWidget {
  final String text;

  const DotAndText({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 8, right: 10),
            height: 3,
            width: 3,
            decoration: BoxDecoration(
              color: dark,
              borderRadius: BorderRadius.circular(1.5),
            ),
          ),
          Text(
           text,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
          )
        ],
      );
}
