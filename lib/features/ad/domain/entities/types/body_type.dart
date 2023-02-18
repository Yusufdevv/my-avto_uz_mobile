import 'package:auto/features/ad/data/models/body_type.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class BodyTypeEntity extends Equatable {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'type')
  final String type;
  @JsonKey(name: 'logo')
  final String logo;

  const BodyTypeEntity({
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

class BodyTypeEntityConverter
    extends JsonConverter<BodyTypeEntity, Map<String, dynamic>?> {
  const BodyTypeEntityConverter();

  @override
  BodyTypeEntity fromJson(Map<String, dynamic>? json) =>
      BodyTypeModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(BodyTypeEntity object) => BodyTypeModel(
        id: object.id,
        logo: object.logo,
        type: object.type,
      ).toJson();
}
