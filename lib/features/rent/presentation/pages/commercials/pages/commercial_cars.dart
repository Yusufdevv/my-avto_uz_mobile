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
  final List<String> titles = [
    'Кондиционер',
    'Полный бак',
    'Автомат коробка'
  ];
  final List<String> icons = [
    AppIcons.wind,
    AppIcons.gas,
    AppIcons.gearBox,
  ];

  final List<RentCarEntity> rentCarEntity = [
    const RentCarEntity(
      carName: 'Chevrolet Malibu 2.0',
      url:
      'https://uzautomotors.com/images/uploads/a35dd4bc6d3786affb92a6a5b7e8f79a.jpg',
      price: '1000000',
    ),
    const RentCarEntity(
      carName: 'Chevrolet Malibu 2.0',
      url:
      'https://uzautomotors.com/images/uploads/a35dd4bc6d3786affb92a6a5b7e8f79a.jpg',
      price: '1000000',
    ),
    const RentCarEntity(
      carName: 'Chevrolet Malibu 2.0',
      url:
      'https://www.carscoops.com/wp-content/uploads/2022/04/Dongfeng-Voyah-Dreamer-main.jpg',
      price: '1000000',
    ),
    const RentCarEntity(
      carName: 'Chevrolet Malibu 2.0',
      url:
      'https://uzautomotors.com/images/uploads/a35dd4bc6d3786affb92a6a5b7e8f79a.jpg',
      price: '1000000',
    ),
    const RentCarEntity(
      carName: 'Chevrolet Malibu 2.0',
      url:
      'https://uzautomotors.com/images/uploads/a35dd4bc6d3786affb92a6a5b7e8f79a.jpg',
      price: '1000000',
    ),
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
        height: 156 ,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => RentCarItems(
            rentCarEntity: rentCarEntity[index],
          ),
          itemCount: rentCarEntity.length,
        ),
      ),
      const SizedBox(height: 16,),
      AllButtonItem(
        title: 'Грузовые',
        onTap: () {},
      ),
      SizedBox(
        height: 158,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => RentCarItems(
            rentCarEntity: rentCarEntity[index],
          ),
          itemCount: rentCarEntity.length,
        ),
      ),
      const SizedBox(height: 16,),
      AllButtonItem(
        title: 'Шаттл',
        onTap: () {},
      ),
      SizedBox(
        height: 158,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => RentCarItems(
            rentCarEntity: rentCarEntity[index],
          ),
          itemCount: rentCarEntity.length,
        ),
      ),
      const SizedBox(height: 16,),
    ],
  );
}
