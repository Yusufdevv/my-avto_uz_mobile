import 'package:auto/assets/colors/color.dart';
import 'package:flutter/material.dart';

class CharacteristicsComparisonWidget extends StatelessWidget {
  final int numberOfAddedCars;
  final String parameterName;
  final Color color;
  const CharacteristicsComparisonWidget({
    required this.color,
    required this.parameterName,
    required this.numberOfAddedCars,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(children: [
        Container(
          height: 54,
          color: color,
          child: ListView(
            scrollDirection: Axis.horizontal,
          ),
        ),
        Positioned(
            top: 8,
            left: 16,
            child: Text(
              parameterName,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: grey,
              ),
            ))
      ]);
}

/*Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              parameterName,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: grey,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    '2016',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
                if (numberOfAddedCars == 1)
                  const SizedBox()
                else
                  Text(
                    '2016',
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
              ],
            )
          ],
        ),
      )*/
