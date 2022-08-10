import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/favorites/presentation/pages/favourite_screen.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FavouriteItem extends StatelessWidget {
  const FavouriteItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color:
              Theme.of(context).extension<ThemedColors>()!.whiteLilacToWhite4,
          border: Border.all(
            width: 1,
            color:
                Theme.of(context).extension<ThemedColors>()!.solitudeToDolphin8,
          ),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: orange,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(2, 2),
                          blurRadius: 3,
                          color: white.withOpacity(.24),
                        ),
                      ]),
                  child: SvgPicture.asset(AppIcons.heartWhite),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'У вас ещё нет избранных объявлений',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Сохраняйте объявления, которые  понравились вам при поиске.',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontSize: 10,
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .dolphinToWhite60),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            WButton(
              onTap: () =>
                  Navigator.push(context, fade(page: FavouriteScreen())),
              text: 'Перейти к поиску',
              height: 36,
              color: Theme.of(context)
                  .extension<ThemedColors>()!
                  .cinnabar12ToCinnabar,
              textStyle:
                  Theme.of(context).textTheme.headline5!.copyWith(fontSize: 14),
            ),
          ],
        ),
      );
}
