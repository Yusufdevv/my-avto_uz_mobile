import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/rent/domain/entities/rent_list_entity.dart';
import 'package:auto/features/rent/presentation/pages/rent_single/pages/cars_single_screen.dart';
import 'package:auto/features/rent/presentation/widgets/all_button_item.dart';
import 'package:auto/features/rent/presentation/widgets/rent_car_items.dart';
import 'package:auto/features/rent/presentation/widgets/service_type_item.dart';
import 'package:flutter/material.dart';

class CarsScreen extends StatefulWidget {
  const CarsScreen({Key? key}) : super(key: key);

  @override
  State<CarsScreen> createState() => _CarsScreenState();
}

class _CarsScreenState extends State<CarsScreen> {
  final List<String> titles = ['Кондиционер', 'Полный бак', 'Автомат коробка'];
  final List<String> icons = [
    AppIcons.wind,
    AppIcons.gas,
    AppIcons.gearBox,
  ];
  final List<bool> isSelected = [false, false, false];

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
                          icon: icons[index],
                          title: titles[index],
                          onTap: () {},
                        ))
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          AllButtonItem(
            title: 'Минивены',
            onTap: () {},
          ),
          SizedBox(
            height: 156,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => RentCarItems(
                rentEntity: const RentListEntity(),
                onTap: () => Navigator.push(
                  context,
                  fade(
                    page: const CarsSingleScreen(
                        rentListEntity: RentListEntity()),
                  ),
                ),
              ),
              itemCount: 10,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          AllButtonItem(
            title: 'Грузовые',
            onTap: () {},
          ),
          SizedBox(
            height: 158,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => RentCarItems(
                rentEntity: const RentListEntity(),
                onTap: () => Navigator.push(
                  context,
                  fade(
                    page: const CarsSingleScreen(
                        rentListEntity: RentListEntity()),
                  ),
                ),
              ),
              itemCount: 10,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          AllButtonItem(
            title: 'Шаттл',
            onTap: () {},
          ),
          SizedBox(
            height: 158,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => RentCarItems(
                rentEntity: const RentListEntity(),
                onTap: () => Navigator.push(
                  context,
                  fade(
                    page: const CarsSingleScreen(
                        rentListEntity: RentListEntity()),
                  ),
                ),
              ),
              itemCount: 10,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      );
}
