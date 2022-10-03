import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/rent/domain/entities/rent_car_entity.dart';
import 'package:auto/features/rent/presentation/pages/rent_single/widgets/options_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AdditionalOptions extends StatefulWidget {
  const AdditionalOptions({Key? key}) : super(key: key);

  @override
  State<AdditionalOptions> createState() => _AdditionalOptionsState();
}

class _AdditionalOptionsState extends State<AdditionalOptions> {
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
            Text(
              LocaleKeys.additional_options.tr(),
              style:
                  Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 8,
            ),
            Wrap(
              spacing: 12,
              runSpacing: 8,
              direction: Axis.horizontal,
              children: [
                ...List.generate(
                  10,
                  (index) => OptionsItem(
                    rentCarEntity: RentCarEntity(),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
