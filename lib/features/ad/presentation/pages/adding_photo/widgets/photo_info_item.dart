import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';

class PhotoInfoItem extends StatelessWidget {
  const PhotoInfoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Container(
              height: 229,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
              child: Image.asset(
                AppImages.bmwInfo,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Постарайтесь сделать так чтобы фото которое вы добавляете было максмально по высокого качество. Чем выше качество, тем удобнее будет вашим  потенциальным клиентам дать достойную оценку вашему автомобилю и возможно приобрести его.',
              style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Theme.of(context)
                      .extension<ThemedColors>()!
                      .midnightExpressToDolphin),
            ),
          ],
        ),
      );
}
