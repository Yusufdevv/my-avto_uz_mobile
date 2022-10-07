import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/rent/domain/entities/rent_list_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategorySingleItem extends StatelessWidget {
  final RentListEntity rentListEntity;
  final VoidCallback onTap;

  const CategorySingleItem(
      {required this.rentListEntity, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 1,
              color: Theme.of(context)
                  .extension<ThemedColors>()!
                  .solitudeToDarkRider,
            ),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 16,
                color: black.withOpacity(.05),
              ),
            ],
            color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  height: 137,
                  width: double.infinity,
                  imageUrl: rentListEntity.rentCar.gallery.first,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                '${rentListEntity.rentCar.generation.yearBegin}-${rentListEntity.rentCar.generation.yearEnd}, '
                    '${rentListEntity.rentCar.model.name}',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      );
}
