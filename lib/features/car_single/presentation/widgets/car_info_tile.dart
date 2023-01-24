import 'package:auto/assets/colors/color.dart';
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
              flex: 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '$text ',
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontWeight: FontWeight.w400, fontSize: 14, color: grey),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: dividerColor))),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                ' $value',
                style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontWeight: FontWeight.w600, fontSize: 14, color: grey),
              ),
            ),
          ],
        ),
      );
}
