import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchSuffixCancelButton extends StatelessWidget {
  final VoidCallback onTap;
  const SearchSuffixCancelButton({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) => WScaleAnimation(
        onTap: onTap,
        child: Container(
          height: 24,
          width: 24,
          decoration: BoxDecoration(
            color: Theme.of(context)
                .extension<ThemedColors>()!
                .whiteSmoke78ToWhiteSmoke12,
            borderRadius: BorderRadius.circular(12),
          ),
          child: SvgPicture.asset(
            AppIcons.check,
            color: makeSearchCancel,
          ),
        ),
      );
}
