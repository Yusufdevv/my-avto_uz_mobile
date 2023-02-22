import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VinTitleItem extends StatelessWidget {
  final String title;

  const VinTitleItem({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            SvgPicture.asset(
              AppIcons.shieldRound,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: dark,
                  ),
            ),
          ],
        ),
      );
}
