import 'package:auto/features/ad/data/models/drive_type.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DriveTypeEntity extends Equatable {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'type')
  final String type;
  @JsonKey(
    name: 'logo',
  )
  final String logo;

  const DriveTypeEntity({
    this.id = -1,
    this.type = '',
    this.logo = '',
  });

  @override
  List<Object?> get props => [
        id,
        type,
        logo,
      ];
}

class DriveTypeEntityConverter
    extends JsonConverter<DriveTypeEntity, Map<String, dynamic>?> {
  const DriveTypeEntityConverter();

  @override
  DriveTypeEntity fromJson(Map<String, dynamic>? json) =>
      DriveTypeModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(DriveTypeEntity object) => DriveTypeModel(
        id: object.id,
        logo: object.logo,
        type: object.type,
      ).toJson();
}
