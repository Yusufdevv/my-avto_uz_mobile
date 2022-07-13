import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WAppBarChild extends StatelessWidget implements PreferredSizeWidget {
  const WAppBarChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => WAppBar(
        height: 67,
        childWithButton: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AppImages.autoUzCircle,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Служба поддержжки',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  '24/7',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: hoursGreen),
                ),
              ],
            ),
          ],
        ),
        child: WScaleAnimation(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(right: 16, top: 11),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: whiteSmoke,
            ),
            child: SvgPicture.asset(AppIcons.phoneCall),
          ),
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
