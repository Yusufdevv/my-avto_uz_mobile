import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'body_type.g.dart';

@JsonSerializable()
class BodyTypeModel extends BodyTypeEntity {
  const BodyTypeModel({
    required super.id,
    required super.type,
    required super.logo,
  });

  factory BodyTypeModel.fromJson(Map<String, dynamic> json) =>
      _$BodyTypeModelFromJson(json);
}
