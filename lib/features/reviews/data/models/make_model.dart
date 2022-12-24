import 'package:auto/features/reviews/domain/entities/make_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'make_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MakeModel extends MakeEntity {
  MakeModel({
    required super.id,
    required super.logo,
    required super.name,
  });

  factory MakeModel.fromJson(Map<String, dynamic> json) =>
      _$MakeModelFromJson(json);
  Map<String, dynamic> toJson() => _$MakeModelToJson(this);
}
