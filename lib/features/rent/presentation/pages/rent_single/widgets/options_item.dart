import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/rent/domain/entities/options_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OptionsItem extends StatelessWidget {
  final OptionsEntity optionsEntity;
  const OptionsItem({required this.optionsEntity, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    height: 38,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1,
              color: Theme.of(context)
                  .extension<ThemedColors>()!
                  .solitudeToDarkRider,
            ),
            color: Theme.of(context).extension<ThemedColors>()!.solitudeToNero),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (optionsEntity.hasOption)
              SvgPicture.asset(AppIcons.checkGreen)
            else
              SvgPicture.asset(AppIcons.mad),
            const SizedBox(
              width: 8,
            ),
            Text(
              optionsEntity.title,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontSize: 12, color: greyText),
            )
          ],
        ),
      );
}
