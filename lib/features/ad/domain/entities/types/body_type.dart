import 'package:auto/features/ad/data/models/body_type.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class BodyTypeEntity extends Equatable {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'type', defaultValue: '')
  final String type;
  @JsonKey(name: 'logo', defaultValue: '')
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
  Map<String, dynamic> toJson(BodyTypeEntity object) => {};
}
