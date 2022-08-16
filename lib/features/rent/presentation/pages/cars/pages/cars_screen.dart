import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/rent/domain/entities/category_entity.dart';
import 'package:auto/features/rent/domain/entities/rent_car_entity.dart';
import 'package:auto/features/rent/presentation/pages/category_single/pages/single_category_screen.dart';
import 'package:auto/features/rent/presentation/widgets/category_type_item.dart';
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
    'Детское кресло',
    'Полный бак',
    'Автомат коробка'
  ];
  final List<String> icons = [
    AppIcons.wind,
    AppIcons.child,
    AppIcons.gas,
    AppIcons.gearBox,
  ];

  final List<RentCarEntity> rentCarEntity = [
    const RentCarEntity(
      carName: 'Chevrolet Malibu 2.0',
      url:
      'https://uzautomotors.com/images/uploads/a35dd4bc6d3786affb92a6a5b7e8f79a.jpg',
      price: '1000000',
      carModel: '2019-2022, || YTTU'
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
  late CategoryEntity crossoverEntity;
  late CategoryEntity comfortEntity;
  late CategoryEntity sedanEntity;
  late CategoryEntity premiumEntity;
  @override
  void initState() {
    crossoverEntity = CategoryEntity(rentCarEntity: rentCarEntity, title: 'Кроссовер');
    comfortEntity = CategoryEntity(rentCarEntity: rentCarEntity, title: 'Комфорт');
    sedanEntity = CategoryEntity(rentCarEntity: rentCarEntity, title: 'Городские седаны');
    premiumEntity = CategoryEntity(rentCarEntity: rentCarEntity, title: 'Премиальные');

    super.initState();
  }
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
     CategoryTypeItem(onTap: () => Navigator.push(context, fade(page: SingleCategoryScreen(categoryEntity: comfortEntity,))), categoryEntity: comfortEntity,),
      const SizedBox(height: 16,),
      CategoryTypeItem(onTap: ()  => Navigator.push(context, fade(page: SingleCategoryScreen(categoryEntity: sedanEntity,))), categoryEntity: sedanEntity,),

      const SizedBox(height: 16,),
      CategoryTypeItem(onTap: ()=> Navigator.push(context, fade(page: SingleCategoryScreen(categoryEntity: crossoverEntity,))), categoryEntity: crossoverEntity,),

      const SizedBox(height: 16,),
      CategoryTypeItem(onTap: () => Navigator.push(context, fade(page: SingleCategoryScreen(categoryEntity: premiumEntity,))), categoryEntity: premiumEntity,),

      const SizedBox(height: 16,),
    ],
  );
}
