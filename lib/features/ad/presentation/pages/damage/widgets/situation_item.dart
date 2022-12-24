import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SituationItem extends StatelessWidget {
  final String position;
  final String situation;
  const SituationItem({required this.position, required this.situation,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(AppIcons.checkRounded),
            const SizedBox(width: 8,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(position, style:  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14, color: grey),)
                ,const SizedBox(height: 2,),
                Text(situation, style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 16, fontWeight: FontWeight.w600),)
              ],
            ),
          ],
        ),
        const SizedBox(height: 12,),
        Divider(
          thickness: 1,
          color: Theme.of(context).dividerColor,
        ),
      ],
    ),
  );
}
