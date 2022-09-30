import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/rent/domain/entities/rent_car_entity.dart';
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
          AllButtonItem(
            title: 'Минивены',
            onTap: () {},
          ),
          SizedBox(
            height: 156,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => const RentCarItems(
                rentEntity: RentCarEntity(),
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
              itemBuilder: (context, index) => const RentCarItems(
                rentEntity: RentCarEntity(),
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
              itemBuilder: (context, index) => const RentCarItems(
                rentEntity: RentCarEntity(),
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
