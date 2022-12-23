import 'package:auto/assets/colors/light.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CupertinoActivityIndicator(radius: 16),
            const SizedBox(height: 12),
            Text(
              'Загрузка данных...',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: LightThemeColors.greyTextColor),
            )
          ],
        ),
      );
}
