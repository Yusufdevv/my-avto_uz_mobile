import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/rent/domain/entities/rent_car_entity.dart';
import 'package:auto/features/rent/presentation/pages/rent_single/widgets/options_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AdditionalOptions extends StatefulWidget {
  final RentCarEntity rentCarEntity;
  const AdditionalOptions({required this.rentCarEntity, Key? key})
      : super(key: key);

  @override
  State<AdditionalOptions> createState() => _AdditionalOptionsState();
}

class _AdditionalOptionsState extends State<AdditionalOptions> {
  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(top: 16),
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
            Text(
              LocaleKeys.additional_options.tr(),
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                OptionsItem(
                  isHas: widget.rentCarEntity.isClean,
                  title: LocaleKeys.washed_car.tr(),
                ),
                const SizedBox(width: 12),
                OptionsItem(
                  isHas: widget.rentCarEntity.hasBabySeat,
                  title: LocaleKeys.baby_chair.tr(),
                ),
              ],
            ),
            const SizedBox(height: 12),
            OptionsItem(
              isHas: widget.rentCarEntity.isFullFuel,
              title: LocaleKeys.full_tank_of_gasoline.tr(),
            ),
          ],
        ),
      );
}
