import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FilterItem extends StatelessWidget {
  final String title;
  const FilterItem({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(top: 16, left: 16),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 4),
          blurRadius: 16,
          color: black.withOpacity(.05),
        ),
      ]
    ),
    child: Row(
      children: [
        Text(title, style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.w600, fontSize: 14),),
        const SizedBox(width: 13,),
        WScaleAnimation(child: Container(
          height: 16,
          width: 16,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).extension<ThemedColors>()!.ghostToGondola,
          ),
          child: SvgPicture.asset(AppIcons.closeWhite),
        ), onTap: (){})
      ],
    ),
  );
}
