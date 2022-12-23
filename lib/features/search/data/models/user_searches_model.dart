
import 'package:auto/features/search/domain/entities/user_searches_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_searches_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserSearchesModel extends UserSearchesEntity {
  const UserSearchesModel({required super.id, required super.searchText});

  factory UserSearchesModel.fromJson(Map<String, dynamic> json) =>
      _$UserSearchesModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserSearchesModelToJson(this);
}
