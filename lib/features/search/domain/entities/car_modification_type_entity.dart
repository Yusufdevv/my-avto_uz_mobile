// import 'package:auto/features/car_single/data/models/car_modification_type_model.dart';
// import 'package:auto/features/search/data/models/car_modification_type_model.dart';
// import 'package:equatable/equatable.dart';
// import 'package:json_annotation/json_annotation.dart';

// class CarModificationTypeEntity extends Equatable {
//   const CarModificationTypeEntity({
//     this.id = 0,
//     this.power = '',
//     this.volume = '',
//   });

//   final int id;
//   final String power;
//   final String volume;

//   @override
//   List<Object?> get props => [id, power, volume];
// }

// class CarModificationTypeConverter
//     implements JsonConverter<CarModificationTypeEntity, Map<String, dynamic>?> {
//   const CarModificationTypeConverter();

//   @override
//   CarModificationTypeEntity fromJson(Map<String, dynamic>? json) =>
//       CarModificationTypeModel.fromJson(json ?? {});

//   @override
//   Map<String, dynamic> toJson(CarModificationTypeEntity object) => {};
// }
