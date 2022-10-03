import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/rent/domain/entities/rent_car_entity.dart';
import 'package:auto/features/rent/domain/entities/rent_entity.dart';
import 'package:auto/features/rent/presentation/pages/category_single/pages/single_category_screen.dart';
import 'package:auto/features/rent/presentation/widgets/category_type_item.dart';
import 'package:auto/features/rent/presentation/widgets/service_type_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CarsScreen extends StatefulWidget {
  const CarsScreen({Key? key}) : super(key: key);

  @override
  State<CarsScreen> createState() => _CarsScreenState();
}

class _CarsScreenState extends State<CarsScreen> {
  final List<String> titles = [
    LocaleKeys.conditioner.tr(),
    LocaleKeys.baby_chair.tr(),
    LocaleKeys.full_tank.tr(),
    LocaleKeys.automatic_box.tr(),
  ];
  final List<String> icons = [
    AppIcons.wind,
    AppIcons.child,
    AppIcons.gas,
    AppIcons.gearBox,
  ];

  @override
  Widget build(BuildContext context) => ListView(
        children: [
          SizedBox(
            height: 46,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...List.generate(
                    titles.length,
                    (index) => ServiceTypeItem(
                        icon: icons[index], title: titles[index]))
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CategoryTypeItem(
            onTap: () => Navigator.push(
              context,
              fade(
                page: const SingleCategoryScreen(
                  rentEntity: RentEntity(),
                ),
              ),
            ),
            rentCarEntity: RentCarEntity(),
          ),
          const SizedBox(
            height: 16,
          ),
          CategoryTypeItem(
            onTap: () => Navigator.push(
              context,
              fade(
                page: SingleCategoryScreen(
                  rentEntity: RentEntity(),
                ),
              ),
            ),
            rentCarEntity: RentCarEntity(),
          ),
          const SizedBox(
            height: 16,
          ),
          CategoryTypeItem(
            onTap: () => Navigator.push(
                context,
                fade(
                    page: SingleCategoryScreen(
                  rentEntity: RentEntity(),
                ))),
            rentCarEntity: RentCarEntity(),
          ),
          const SizedBox(
            height: 16,
          ),
          CategoryTypeItem(
            onTap: () => Navigator.push(
              context,
              fade(
                page: SingleCategoryScreen(
                  rentEntity: RentEntity(),
                ),
              ),
            ),
            rentCarEntity: RentCarEntity(),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      );
}
