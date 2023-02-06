import 'package:auto/assets/colors/color.dart';
import 'package:flutter/material.dart';

class TextSpacer extends StatelessWidget {
  final String title;
  final String value;
  final EdgeInsets padding;

  const TextSpacer({
    required this.title,
    required this.value,
    Key? key, 
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding,
        child: Row(
          children: [
            Text(title,
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: grey)),
            const Spacer(),
            Text(value,
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 14, fontWeight: FontWeight.w600)),
          ],
        ),
      );
}
