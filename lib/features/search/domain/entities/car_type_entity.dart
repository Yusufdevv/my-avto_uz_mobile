// import 'package:auto/features/search/data/models/car_type_model.dart';
// import 'package:equatable/equatable.dart';
// import 'package:json_annotation/json_annotation.dart';

// class CarTypeEntity extends Equatable {
//   const CarTypeEntity({
//     this.id = 0,
//     this.type = '',
//     this.logo = '',
//   });

//   final int id;
//   final String type;
//   final String logo;

//   @override
//   List<Object?> get props => [id, type, logo];
// }

// class CarTypeConverter
//     implements JsonConverter<CarTypeEntity, Map<String, dynamic>?> {
//   const CarTypeConverter();

//   @override
//   CarTypeEntity fromJson(Map<String, dynamic>? json) =>
//       CarTypeModel.fromJson(json ?? {});

//   @override
//   Map<String, dynamic> toJson(CarTypeEntity object) => {};
// }
