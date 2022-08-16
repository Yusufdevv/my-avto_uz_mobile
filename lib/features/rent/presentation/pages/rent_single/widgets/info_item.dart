import 'package:auto/assets/colors/color.dart';
import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  final String title;
  final String description;
  final TextStyle? textStyle;
  const InfoItem({required this.title, this.textStyle, required this.description, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Row(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline2!.copyWith(color: grey),
            ),
            const SizedBox(width: 2,),
            Container(
              width: 178,
              margin: const EdgeInsets.only(top: 10
              ),
              height: 1,
              color: Theme.of(context).dividerColor,
            ),
            const SizedBox(width: 2,),
            Text(description, style: textStyle ??  Theme.of(context).textTheme.subtitle2!.copyWith(color: greyText),)
          ],
        ),
  );
}
