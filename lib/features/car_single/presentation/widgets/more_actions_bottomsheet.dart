import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/car_single/presentation/parts/vin_page.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';

class MoreActions extends StatelessWidget {
  const MoreActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              16,
            ),
            topRight: Radius.circular(
              16,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                Text(
                  'Действия',
                  style: Theme.of(context).textTheme.headline1,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    AppIcons.close,
                    width: 32,
                    height: 32,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
            const SizedBox(
              height: 26,
            ),
            const Divider(),
            WScaleAnimation(
              onTap: () {
                Navigator.of(context).push(fade(page: const VinPage()));
              },
              child: Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  SvgPicture.asset(
                    AppIcons.file,
                    width: 32,
                    height: 32,
                    color: orange,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Отчет (VIN)',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 52),
              child: Divider(),
            ),
            WScaleAnimation(
              onTap: () {},
              child: Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  SvgPicture.asset(
                    AppIcons.scale,
                    width: 32,
                    height: 32,
                    color: orange,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Сравнить',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 52),
              child: Divider(),
            ),
            WScaleAnimation(
              onTap: SharePressed,
              child: Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  SvgPicture.asset(
                    AppIcons.share,
                    width: 32,
                    height: 32,
                    color: orange,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Поделиться',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom + 36,
            ),
          ],
        ),
      );
}

void SharePressed() {
  String message = 'Auto uz';
  Share.share(message);
}
