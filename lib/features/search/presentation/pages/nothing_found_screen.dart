import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:flutter/material.dart';

class NothingFoundScreen extends StatelessWidget {
  const NothingFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: border,
                borderRadius: BorderRadius.circular(150),
              ),
              height: 92,
              width: 92,
              margin: const EdgeInsets.only(bottom: 24),
              padding: const EdgeInsets.all(20),
              child: Image.asset(
                AppImages.noItemFoundCar,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'Нет результатов',
              style:
                  Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'К соэалению, по вашему запросу результаты не найдены',
              maxLines: 2,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: greyText),
            ),
          ],
        ),
      );
}
