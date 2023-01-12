import 'package:auto/features/reviews/data/models/make_model.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class MakeEntity extends Equatable {
  final int id;
  final String name;
  final String logo;

  const MakeEntity({
    this.id = -1,
    this.name = '',
    this.logo = '',
  });

  @override
  List<Object?> get props => [
        id,
        name,
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
  Map<String, dynamic> toJson(MakeEntity object) =>
      MakeModel(id: object.id, name: object.name, logo: object.logo).toJson();
}
