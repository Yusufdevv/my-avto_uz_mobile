import 'package:auto/features/car_single/domain/entities/car_single_entity.dart';

class CarSingleModel extends CarSingleEntity{
   CarSingleModel({
    required super.date,
    required super.carComplectation,
    required super.autoName,
    required super.views,
    required super.price
});
}