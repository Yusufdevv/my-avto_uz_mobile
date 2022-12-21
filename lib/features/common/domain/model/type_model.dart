
import 'package:auto/features/common/domain/entity/type_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'type_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TypeModel extends TypeEntity {
  const TypeModel(
      {required super.id, required super.logo, required super.type});
  factory TypeModel.fromJson(Map<String, dynamic> json) =>
      _$TypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$TypeModelToJson(this);
}
