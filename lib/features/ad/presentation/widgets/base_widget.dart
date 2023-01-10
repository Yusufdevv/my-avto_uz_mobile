import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BaseWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;
  final EdgeInsets? padding;
  final bool hasButton;

  const BaseWidget(
      {required this.child,
      this.onTap,
      this.padding,
      this.hasButton = true,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 16),
        padding: padding,
        decoration: BoxDecoration(
            color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(20))),
        child: hasButton
            ? Stack(
                children: [
                  child,
                  Positioned(
                    bottom: MediaQuery.of(context).padding.bottom + 16,
                    right: 16,
                    left: 16,
                    child: WButton(
                      onTap: onTap ?? () {},
                      text: LocaleKeys.further.tr(),
                      shadow: [
                        BoxShadow(
                            offset: const Offset(0, 4),
                            blurRadius: 20,
                            color: orange.withOpacity(0.2)),
                      ],
                    ),
                  ),
                ],
              )
            : child,
      );
}
