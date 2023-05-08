import 'package:auto/features/reels/data/models/dealer_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class DealerEntity extends Equatable {
  final int id;
  final String name;
  final String image;
  final String slug;

  const DealerEntity({
    this.id = -1,
    this.name = '',
    this.image = '',
    this.slug = '',
  });

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        slug,
      ];
}

class DealerConverter
    implements JsonConverter<DealerEntity, Map<String, dynamic>?> {
  const DealerConverter();

  @override
  DealerEntity fromJson(Map<String, dynamic>? json) =>
      DealerModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(DealerEntity object) => {};
}
