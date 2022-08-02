import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SituationTitleItem extends StatelessWidget {
  final String title;
  final String situation;
  const SituationTitleItem({required this.situation, required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: Theme.of(context)
          .textTheme
          .headline6!
          .copyWith(color: greyText), ),
      const SizedBox(height: 16,),
      Row(
        children: [
          SvgPicture.asset(AppIcons.checkRounded),
          const SizedBox(width: 10,),
          Text(situation, style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 16, fontWeight: FontWeight.w600),)

        ],
      ),
      const SizedBox(height: 11,),
      Divider(
        thickness: 1,
        color: Theme.of(context).dividerColor,
      ),
    ],
  );
}
