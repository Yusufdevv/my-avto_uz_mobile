import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'make.g.dart';

@JsonSerializable()
class MakeModel extends MakeEntity {
  const MakeModel({
    required super.id,
    required super.type,
    required super.logo,
  });

  factory MakeModel.fromJson(Map<String, dynamic> json) =>
      _$MakeModelFromJson(json);
}
