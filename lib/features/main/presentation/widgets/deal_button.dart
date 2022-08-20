import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/reels/presentation/pages/reels_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DealButton extends StatelessWidget {
  const DealButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => WButton(
        height: 52,
        onTap: () => Navigator.of(context, rootNavigator: true)
            .push(fade(page: const ReelsScreen())),
        borderRadius: 12,
        color: purple,
        border: Border.all(width: 1, color: white.withOpacity(0.84)),
        shadow: [
          BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 24,
              color: blueGem.withOpacity(0.35)),
        ],
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SvgPicture.asset(
                  AppIcons.backgroundIcon,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Positioned(
              right: 28,
              child: ClipRRect(child: SvgPicture.asset(AppIcons.videoIcon)),
            ),
            Positioned(
              left: 20,
              top: 14,
              bottom: 14,
              child: Row(
                children: [
                  SvgPicture.asset(AppIcons.flash),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    'Предложения дня',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontSize: 14),
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
