import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; 

class CarPriceText extends StatelessWidget {
  final String text;
  const CarPriceText({required this.text,super.key});

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            '$text UZS',
            style:
                Theme.of(context).textTheme.headline1!.copyWith(fontSize: 24),
          ),
          const SizedBox(
            width: 12,
          ),
          WButton(
            onTap: () {},
            color: blue,
            borderRadius: 6,
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 9),
            width: 24,
            height: 24,
            child: SvgPicture.asset(
              AppIcons.chevronDownWhite,
            ),
          ),
        ],
      ),
    );
}