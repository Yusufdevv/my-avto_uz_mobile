import 'package:auto/assets/colors/color.dart';
import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  final String title;
  final String description;
  final TextStyle? textStyle;

  const InfoItem(
      {required this.title,
      required this.description,
      this.textStyle,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: grey),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                height: 1,
                color: Theme.of(context).dividerColor,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              alignment: Alignment.centerLeft,
              child: Text(
                description,
                style: textStyle ??
                    Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: greyText),
              ),
            )
          ],
        ),
      );
}
