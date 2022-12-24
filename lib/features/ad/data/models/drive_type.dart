import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'drive_type.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DriveTypeModel extends DriveTypeEntity {
  const DriveTypeModel({
    required super.id,
    required super.type,
    required super.logo,
  });

  factory DriveTypeModel.fromJson(Map<String, dynamic> json) =>
      _$DriveTypeModelFromJson(json);
}
