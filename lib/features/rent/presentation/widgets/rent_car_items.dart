import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/rent/domain/entities/rent_list_entity.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RentCarItems extends StatelessWidget {
  final RentListEntity rentEntity;
  final VoidCallback onTap;

  const RentCarItems({required this.rentEntity, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.only(left: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                width: 1,
                color: Theme.of(context)
                    .extension<ThemedColors>()!
                    .solitudeToDarkRider),
            color: Theme.of(context).extension<ThemedColors>()!.whiteToNero1,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                  bottom: Radius.circular(4),
                ),
                child: CachedNetworkImage(
                  width: 162,
                  height: 96,
                  imageUrl: rentEntity.rentCar.gallery.isNotEmpty
                      ? rentEntity.rentCar.gallery.first
                      : '',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  '${rentEntity.rentCar.make} ${rentEntity.rentCar.model}',
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Text(
                      '${MyFunctions.getFormatCost(rentEntity.minAge.toString())} UZS',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      '/сутки',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: 11, color: grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
