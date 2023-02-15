import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/presentation/pages/map_screen/widgets/point_name_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MapPointName extends StatelessWidget {
  final bool isWaiting;
  final String? name;
  const MapPointName({required this.isWaiting, required this.name, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(AppIcons.foldedMap, color: greyText),
          const SizedBox(width: 12),
          if (name == null || isWaiting) ...{
            const PointNameShimmer()
          } else ...{
            Expanded(
              child: Text(
                name ?? '',
                style: Theme.of(context).textTheme.titleSmall!,
              ),
            ),
          }
        ],
      );
}
