import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoOutBottomsheet extends StatelessWidget {
  const LogoOutBottomsheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: const BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Spacer(),
                GestureDetector(
                  child: SvgPicture.asset(
                    AppIcons.close,
                    height: 32,
                    width: 32,
                  ),
                )
              ],
            ),
            Text(
              'Вы действительно',
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              'хотите выйти?',
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              '''
После выхода из приложения, необходимо 
  будет заново пройти авторизацию чтобы
              войти обратно в приложение.
            ''',
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(fontWeight: FontWeight.w400, fontSize: 16),
            ),
            const Spacer(),
            Row(
              children: [],
            )
          ],
        ),
      );
}
