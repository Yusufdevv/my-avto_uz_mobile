import 'package:auto/features/dealers/data/models/mark_in_dealer_model.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class MakeEntity extends Equatable {
  final int id;
  final String name;
  final String slug;
  final String logo;

  const MakeEntity({
    this.id = 0,
    this.name = '',
    this.slug = '',
    this.logo = '',
  });

  @override
  List<Object?> get props => [
    id,
    name,
    slug,
    logo,
  ];
}

class MakeConverter
    implements JsonConverter<MakeEntity, Map<String, dynamic>?> {
  const MakeConverter();

  @override
  MakeEntity fromJson(Map<String, dynamic>? json) =>
      MakeModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(MakeEntity object) => {};
}
