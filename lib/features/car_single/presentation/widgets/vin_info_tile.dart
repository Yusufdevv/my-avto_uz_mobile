import 'package:auto/features/car_single/domain/entities/owner_action.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VinInfoTile extends StatelessWidget {
  final OwnerActionEntity entity;

  const VinInfoTile({
    required this.entity,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              width: 28,
              height: 28,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              child: SvgPicture.asset(entity.icon),
            ),
            const SizedBox(width: 8),
            Text(
              entity.title.tr(),
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontWeight: FontWeight.w400, fontSize: 14),
            ),
          ],
        ),
      );
}
