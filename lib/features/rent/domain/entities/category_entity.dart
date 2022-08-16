import 'package:auto/features/rent/domain/entities/rent_car_entity.dart';

class CategoryEntity{
  final String title;
  final List<RentCarEntity> rentCarEntity;

  const CategoryEntity({required this.rentCarEntity, required this.title});
}