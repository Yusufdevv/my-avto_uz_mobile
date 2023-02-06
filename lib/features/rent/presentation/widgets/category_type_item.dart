import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/rent/domain/entities/rent_main_entity.dart';

import 'package:auto/features/rent/presentation/pages/rent_single/pages/cars_single_screen.dart';
import 'package:auto/features/rent/presentation/widgets/rent_car_items.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryTypeItem extends StatelessWidget {
  final RentMainEntity rentMainEntity;
  final VoidCallback onAllTap;

  const CategoryTypeItem(
      {required this.onAllTap, required this.rentMainEntity, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => rentMainEntity.rentList.isNotEmpty
      ? Column(
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
                    onTap: onAllTap, behavior: HitTestBehavior.opaque,
                    child: Row(
                      children: [
                        Text(
                          LocaleKeys.all.tr().toLowerCase(),
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
                padding: const EdgeInsets.only(right: 12),
                key: UniqueKey(),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => RentCarItems(
                  rentEntity: rentMainEntity.rentList[index],
                  onTap: () => Navigator.push(
                    context,
                    fade(
                      page: CarsSingleScreen(
                          rentListEntity: rentMainEntity.rentList[index]),
                    ),
                  ),
                ),
                itemCount: rentMainEntity.rentList.length,
              ),
            ),
          ],
        )
      : const SizedBox();
}
