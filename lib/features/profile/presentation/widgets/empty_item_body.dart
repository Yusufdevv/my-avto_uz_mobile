import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';

class EmptyItemBody extends StatelessWidget {
  const EmptyItemBody({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context)
                    .extension<ThemedColors>()!
                    .solitude1ToNero),
            child: Image.asset(AppIcons.carIcon),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Theme.of(context)
                    .extension<ThemedColors>()!
                    .midnightExpressToGreySuit,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
}
