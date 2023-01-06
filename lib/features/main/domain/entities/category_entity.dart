import 'package:auto/features/main/data/models/category_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class CategoryEntity extends Equatable {
  const CategoryEntity({
    this.id = -1,
    this.name = '',
  });

  final int id;
  final String name;

  @override
  List<Object?> get props => [id, name];
}

class CategoryConverter
    implements JsonConverter<CategoryEntity, Map<String, dynamic>?> {
  const CategoryConverter();

  @override
  CategoryEntity fromJson(Map<String, dynamic>? json) =>
      CategoryModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(CategoryEntity object) => {};
}
