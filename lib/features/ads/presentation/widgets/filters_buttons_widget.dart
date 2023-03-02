import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_filter_button.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FilterButtonsWidget extends StatelessWidget {
  const FilterButtonsWidget({
    required this.size,
    required this.theme,
    required this.onTapParams1,
    required this.onTapClear1,
    required this.onTapParams2,
    required this.onTapClear2,
    required this.isFilter,
    required this.name,
    required this.regions,
    Key? key,
  }) : super(key: key);

  final Size size;
  final ThemedColors theme;
  final VoidCallback onTapParams1;
  final VoidCallback onTapClear1;
  final VoidCallback onTapParams2;
  final VoidCallback onTapClear2;
  final bool isFilter;
  final String name;
  final List<RegionEntity> regions;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WFilterButton(
              size: size,
              theme: theme,
              icon: AppIcons.filter,
              name: '',
              claerA: isFilter,
              activeColor: orange,
              defaultTitle: LocaleKeys.options.tr(),
              onTap: onTapParams1,
              onTapClear: onTapClear1,
            ),
            WFilterButton(
              size: size,
              theme: theme,
              icon: AppIcons.location,
              name: name,
              claerA: regions.isNotEmpty,
              activeColor: dark,
              defaultTitle: LocaleKeys.all_regions.tr(),
              onTap: onTapParams2,
              onTapClear: onTapClear2,
            ),
          ],
        ),
      );
}
