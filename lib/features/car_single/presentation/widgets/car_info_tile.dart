import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';

class CarInfoTile extends StatelessWidget {
  final String text;
  final String value;

  const CarInfoTile({
    required this.text,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '$text ',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontWeight: FontWeight.w400, fontSize: 14, color: greyText),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .divider,
                      ))),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                ' $value',
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontWeight: FontWeight.w600, fontSize: 14, color: greyText),
              ),
            ),
          ],
        ),
      );
}
