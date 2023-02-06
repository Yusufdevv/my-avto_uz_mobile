import 'package:auto/features/ad/domain/entities/foto_instruction_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'foto_instruction_model.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class FotoInstructionModel extends FotoInstructionEntity {
  const FotoInstructionModel({
    required super.image,
    required super.description,
    required super.id,
    required super.order
  });
  factory FotoInstructionModel.fromJson(Map<String, dynamic> json) =>
      _$FotoInstructionModelFromJson(json);
  Map<String, dynamic> toJson() => _$FotoInstructionModelToJson(this);
}
