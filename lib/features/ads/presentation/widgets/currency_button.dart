import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:flutter/material.dart';

class CurrencyButton extends StatelessWidget {
  final VoidCallback onTap;
  final String currency;
  final bool selected;

  const CurrencyButton(
      {required this.selected,
      required this.onTap,
      required this.currency,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => WButton(
        onTap: onTap,
        height: 36,
        width: MediaQuery.of(context).size.width * 0.45,
        color:
        // selected ? lavender :
        Theme.of(context)
            .extension<ThemedColors>()!
            .whiteSmoke2ToNightRider,
        borderRadius: 46,
        border: selected ? Border.all(color: purple) : null,
        child: Text(
          currency,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color:Theme.of(context)
                .extension<ThemedColors>()!
                .darkToWhite,
          ),
        ),
      );
}
