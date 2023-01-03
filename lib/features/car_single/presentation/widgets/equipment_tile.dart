import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';

class EquipmentTile extends StatelessWidget {
  final String title;

  const EquipmentTile({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            Container(
              height: 6,
              width: 6,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      Theme.of(context).extension<ThemedColors>()!.darkToGrey),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.caption!.copyWith(
                  color:
                      Theme.of(context).extension<ThemedColors>()!.darkToGrey),
            )
          ],
        ),
      );
}
