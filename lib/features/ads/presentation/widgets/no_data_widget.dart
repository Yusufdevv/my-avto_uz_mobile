import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppIcons.carIcon,
              height: 92,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 24),
            Text(
              'Нет результатов',
              style:
                  Theme.of(context).textTheme.headline1!.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'К соэалению, по вашему запросу результаты не найдены',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 14, color: greyText),
            ),
          ],
        ),
      );
}
