import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/posting_ad/choose_car_brand/domain/entity/car_brand_entity.dart';
import 'package:flutter/material.dart';

class CarBrandItem extends StatelessWidget {
  final CarBrandEntity carBrandEntity;
  const CarBrandItem({required this.carBrandEntity, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.symmetric(horizontal: 12, ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
        border: Border.all(
          width: 1,
          color: Theme.of(context).extension<ThemedColors>()!.solitudeToDarkRider
        )
      ),
      child: Column(
        children: [
          const SizedBox(height: 10,),
          Image.asset(carBrandEntity.icon),
          const SizedBox(height: 14,),
          Text(carBrandEntity.title, style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 12, fontWeight: FontWeight.w400),)
        ],
      ),
    );
}
