import 'package:auto/features/ad/data/models/body_type.dart';
import 'package:auto/features/ad/data/models/make.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class MakeEntity extends Equatable {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'type', defaultValue: '')
  final String type;
  @JsonKey(name: 'logo', defaultValue: '')
  final String logo;

  const MakeEntity({
    required this.id,
    required this.type,
    required this.logo,
  });

  @override
  List<Object?> get props => [
        id,
        type,
        logo,
      ];
}

class MakeEntityConverter
    extends JsonConverter<MakeEntity, Map<String, dynamic>?> {
  const MakeEntityConverter();

  @override
  MakeEntity fromJson(Map<String, dynamic>? json) =>
      MakeModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(MakeEntity object) => {};
}
