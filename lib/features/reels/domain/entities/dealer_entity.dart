import 'package:auto/features/reels/data/models/dealer_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class DealerEntity extends Equatable {
  final int id;
  final String name;
  final String image;

  const DealerEntity({
    this.id = -1,
    this.name = '',
    this.image = '',
  });

  @override
  List<Object?> get props => [
        id,
        name,
        image,
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
