
import 'package:auto/features/search/data/models/source_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class SourceEntity extends Equatable {
  const SourceEntity({
    this.absoluteCarName = '',
    this.id = 0,
  });
  @JsonKey(name: 'absolute_car_name')
  final String absoluteCarName;
  @JsonKey(name: 'id')
  final int id;
  @override
  List<Object?> get props => [];
}


class SourceConverter
    implements JsonConverter<SourceEntity, Map<String, dynamic>?> {
  const SourceConverter();

  @override
  SourceEntity fromJson(Map<String, dynamic>? json) =>
      SourceModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(SourceEntity object) => {};
}