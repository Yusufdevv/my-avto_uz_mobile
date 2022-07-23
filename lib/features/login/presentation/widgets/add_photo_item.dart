import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:flutter/material.dart';

class AddPhotoItem extends StatelessWidget {
  const AddPhotoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text('Фото', style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.w400, fontSize: 14),),
      const SizedBox(width: 48,),
      Expanded(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 64,
                  width: 64,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(AppImages.unknownUser)
                    ),
                  ),
                ),
                const SizedBox(width: 21,),
                WButton(onTap: (){}, borderRadius: 4, height: 24,padding: const EdgeInsets.symmetric(horizontal: 12), text: 'Добавить фото', textColor: grey, color: Theme.of(context).extension<ThemedColors>()!.solitudeToBastille,)
              ],
            ),
            const SizedBox(height: 12,),
            Divider(height: 10,
              thickness: 1,
              color: Theme.of(context).extension<ThemedColors>()!.solitudeToWhite35,
            )
          ],
        ),
      )
    ],
  );
}
