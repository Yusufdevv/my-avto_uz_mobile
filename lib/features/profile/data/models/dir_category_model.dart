import 'package:auto/features/profile/domain/entities/dir_category_entity.dart';

class DirCategoryModel extends DirCategoryEntity {
  DirCategoryModel({
    super.id,
    super.name,
    super.carPlaceCount,
  });

  factory DirCategoryModel.fromJson(Map<String, dynamic> json) =>
      DirCategoryModel(
        id: json['id'],
        name: json['name'],
        carPlaceCount: json['car_place_count'],
      );
}
