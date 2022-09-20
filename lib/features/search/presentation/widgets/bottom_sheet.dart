import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class CallBottomSheet extends StatelessWidget {
  const CallBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          WScaleAnimation(
            onTap: () async => {
              await launch('tel:+998991443429'),
            },
            child: Container(
              width: MediaQuery.of(context).size.width - 16,
              decoration: BoxDecoration(
                  color:
                      Theme.of(context).extension<ThemedColors>()!.whiteToNero2,
                  borderRadius: BorderRadius.circular(13)),
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppIcons.greyPhoneCall),
                  const SizedBox(width: 12),
                  const Text('+998 99 144 34 29',
                      style: TextStyle(
                          decorationThickness: 0,
                          color: dodgerBlue,
                          fontWeight: FontWeight.w400,
                          fontSize: 20)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          WScaleAnimation(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: MediaQuery.of(context).size.width - 16,
              decoration: BoxDecoration(
                  color:
                      Theme.of(context).extension<ThemedColors>()!.whiteToNero2,
                  borderRadius: BorderRadius.circular(13)),
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: const Text(
                'Отменить',
                style: TextStyle(
                    decorationThickness: 0,
                    color: dodgerBlue,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      );
}
