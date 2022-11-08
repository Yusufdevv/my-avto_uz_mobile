import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/login/presentation/widgets/SignIn_with_socials.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BaseOnBoarding extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;

  const BaseOnBoarding({required this.onTap, required this.color, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: WButton(
                onTap: onTap,
                text: LocaleKeys.enter_to_system.tr(),
                color: color,
                borderRadius: 8,
                shadow: [
                  BoxShadow(
                      offset: const Offset(0, 4),
                      blurRadius: 20,
                      color: solitude.withOpacity(.12)),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const SignInWithSocials(),
          ],
        ),
      );
}
