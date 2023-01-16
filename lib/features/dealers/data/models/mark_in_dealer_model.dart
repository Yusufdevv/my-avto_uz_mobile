import 'package:auto/features/dealers/domain/entities/make_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mark_in_dealer_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MakeModel extends MakeEntity {
  const MakeModel({
    required super.id,
    required super.logo,
    required super.slug,
    required super.name,
  });

  factory MakeModel.fromJson(Map<String, dynamic> json) =>
      _$MakeModelFromJson(json);

  Map<String, dynamic> toJson() => _$MakeModelToJson(this);
}