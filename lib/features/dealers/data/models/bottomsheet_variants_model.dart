import 'package:auto/features/dealers/domain/entities/bottom_sheet_variants_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'bottomsheet_variants_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BottomsheetVariantsModel extends BottomSheetVariantsEntity {
  BottomsheetVariantsModel({
    required super.id,
    required super.title,
    required super.imageUrl,
  });
  factory BottomsheetVariantsModel.fromJson(Map<String, dynamic> json) =>
      _$BottomsheetVariantsModelFromJson(json);

  Map<String, dynamic> toJson() => _$BottomsheetVariantsModelToJson(this);
}
