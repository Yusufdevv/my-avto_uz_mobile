import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class DirCategoryEntity extends Equatable {
  DirCategoryEntity({
    this.id = -1,
    this.name = '',
    this.carPlaceCount = 0,
  });

  int id;
  String name;
  int carPlaceCount;

  factory DirCategoryEntity.fromJson(Map<String, dynamic> json) =>
      DirCategoryEntity(
        id: json['id'],
        name: json['name'],
        carPlaceCount: json['car_place_count'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'car_place_count': carPlaceCount,
      };

  @override
  List<Object?> get props => [id, name, carPlaceCount];
}
