import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';

class CarCaseItem extends StatelessWidget {
  final String title;
  const CarCaseItem({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: Theme.of(context).extension<ThemedColors>()!.mediumSlateBlue50ToNightRider,
      borderRadius: BorderRadius.circular(12),
    ),
    margin: const EdgeInsets.all(16),
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
    child: Row(
      children: [
        Image.asset(AppImages.carcase),
        const SizedBox(width: 12,),
        Text(title, style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 16, fontWeight: FontWeight.w600),)
      ],
    ),
  );
}
