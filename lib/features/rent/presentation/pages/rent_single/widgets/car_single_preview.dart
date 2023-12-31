import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/pages/preview/widgets/image_viewer.dart';
import 'package:auto/features/rent/domain/entities/rent_list_entity.dart';
import 'package:auto/features/rent/presentation/pages/rent_single/widgets/single_car_info_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CarSinglePreview extends StatelessWidget {
  final RentListEntity rentEntity;
  final bool hasCarInfo;

  const CarSinglePreview({required this.rentEntity, this.hasCarInfo = true, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageViewer(
              images: rentEntity.rentCar.gallery,
              panoramaImages: rentEntity.rentCar.gallery360,
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '${rentEntity.rentCar.make.name} ${rentEntity.rentCar.model.name}',
                style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    '${MyFunctions.getFormatCost(rentEntity.price)} UZS',
                    style:
                        Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w600, fontSize: 24),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    LocaleKeys.per_day.tr(),
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 16, color: grey),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            if (hasCarInfo)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Divider(
                  color: Theme.of(context).dividerColor,
                  thickness: 1,
                ),
              )
            else
              const SizedBox(),
            if (hasCarInfo) SingleCarInfoItemm(rentCarEntity: rentEntity.rentCar) else const SizedBox(),
          ],
        ),
      );
}
