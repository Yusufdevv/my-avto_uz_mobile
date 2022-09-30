import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/rent/domain/entities/rent_list_entity.dart';
import 'package:auto/features/rent/domain/entities/rent_main_entity.dart';
import 'package:auto/features/rent/presentation/widgets/rent_car_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryTypeItem extends StatelessWidget {
  final RentMainEntity rentMainEntity;
  final VoidCallback onTap;

  const CategoryTypeItem(
      {required this.onTap, required this.rentMainEntity, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  rentMainEntity.name,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Row(
                    children: [
                      Text(
                        'все',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 14, color: greyText),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      SvgPicture.asset(AppIcons.chevronRightGrey)
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 158,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => RentCarItems(
                rentEntity: rentMainEntity.rentCars[index],
              ),
              itemCount: rentMainEntity.rentCars.length,
            ),
          ),
        ],
      );
}
