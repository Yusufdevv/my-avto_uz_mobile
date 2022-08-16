import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';

class RequirementItem extends StatelessWidget {
  final String age;
  final String experience;
  const RequirementItem({required this.age, required this.experience, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.symmetric(vertical: 16),
    decoration: BoxDecoration(
      color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
      border: Border.all(
          width: 1,
          color: Theme.of(context)
              .extension<ThemedColors>()!
              .solitudeToDarkRider),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Требования', style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 14),),
        const SizedBox(height: 12,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Минимальный возраст', style: Theme.of(context).textTheme.bodyText1!.copyWith(color: grey),),
            Text('$age года', style: Theme.of(context).textTheme.headline6!.copyWith(color: greyText, fontSize: 12),),
          ],
        ),
        const SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Минимальный стаж вождения', style: Theme.of(context).textTheme.bodyText1!.copyWith(color: grey),),
            Text('$experience года', style: Theme.of(context).textTheme.headline6!.copyWith(color: greyText, fontSize: 12),),
          ],
        ),
      ],
    ),
  );
}
