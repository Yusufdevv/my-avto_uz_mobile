import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/dealers/presentation/widgets/dealer_single_info_part.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlaceInspection extends StatelessWidget {
  const PlaceInspection({
    required this.lat,
    required this.long,
    required this.id,
    required this.name,
    Key? key,
  }) : super(key: key);
  final double lat;
  final double long;
  final int id;
  final String name;

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
            border: Border.symmetric(
                horizontal: BorderSide(
                    width: 1, color: Theme.of(context).dividerColor))),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LocaleKeys.place_of_inspection.tr(),
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 18)),
            const SizedBox(height: 8),
            MapBox(
              dealerId: id,
              dealerName: name,
              latitude: lat,
              longitude: long,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                SvgPicture.asset(AppIcons.send2),
                const SizedBox(width: 8),
                Text(
                  r'$regionName, $districtName',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 14),
                ),
              ],
            )
          ],
        ),
      );
}
