import 'package:auto/features/dealers/data/models/mark_in_dealer_model.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DealerMakeEntity extends Equatable {
  final int id;
  final String name;
  final String slug;
  final String logo;

  const DealerMakeEntity({
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

class DealerMakeConverter
    implements JsonConverter<DealerMakeEntity, Map<String, dynamic>?> {
  const DealerMakeConverter();

  @override
  DealerMakeEntity fromJson(Map<String, dynamic>? json) =>
      DealerMakeModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(DealerMakeEntity object) => {};
}
