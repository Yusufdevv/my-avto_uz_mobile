import 'package:auto/features/dealers/domain/entities/user_search.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_search_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserSearchDealerModel extends UserSearchesDealerEntity {
  const UserSearchDealerModel({required super.id, required super.searchText});

  factory UserSearchDealerModel.fromJson(Map<String, dynamic> json) =>
      _$UserSearchDealerModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserSearchDealerModelToJson(this);
}
