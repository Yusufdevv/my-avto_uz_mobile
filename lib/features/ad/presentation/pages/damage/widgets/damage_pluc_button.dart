import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DamagePlucButton extends StatelessWidget {
  final VoidCallback onTap;
  const DamagePlucButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => WScaleAnimation(
        onTap: onTap,
        child: Container(
          height: 24,
          width: 24,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  Theme.of(context).extension<ThemedColors>()!.whiteToGondola,
              boxShadow: const [
                BoxShadow(
                    color: Color(0xffE5E5E5),
                    offset: Offset(0, 4),
                    blurRadius: 24,
                    spreadRadius: 0)
              ]),
          child: Center(
            child: SvgPicture.asset(AppIcons.plus),
          ),
        ),
      );
}
