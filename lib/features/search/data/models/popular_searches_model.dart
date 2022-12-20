import 'package:auto/features/search/domain/entities/popular_searches_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'popular_searches_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PopularSearchesModel extends PopularSearchesEntity {
  const PopularSearchesModel({super.count,super.next,super.previous,super.results});

  factory PopularSearchesModel.fromJson(Map<String, dynamic> json) =>
      _$PopularSearchesModelFromJson(json);

  Map<String, dynamic> toJson() => _$PopularSearchesModelToJson(this);
}
