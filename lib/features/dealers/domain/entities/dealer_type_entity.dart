import 'package:auto/features/dealers/data/models/dealer_type_model.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DealerTypeEntity extends Equatable {
  final int id;
  final String name;

  const DealerTypeEntity({
    this.id = -1,
    this.name = '',
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}

class DealerTypeConverter
    implements JsonConverter<DealerTypeEntity, Map<String, dynamic>?> {
  const DealerTypeConverter();

  @override
  DealerTypeEntity fromJson(Map<String, dynamic>? json) =>
      DealerTypeModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(DealerTypeEntity object) => {};
}
