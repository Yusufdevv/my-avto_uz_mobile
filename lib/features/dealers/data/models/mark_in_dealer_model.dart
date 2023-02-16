import 'package:auto/features/dealers/domain/entities/make_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mark_in_dealer_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DealerMakeModel extends DealerMakeEntity {
  const DealerMakeModel({
    required super.id,
    required super.logo,
    required super.slug,
    required super.name,
  });

  factory DealerMakeModel.fromJson(Map<String, dynamic> json) =>
      _$DealerMakeModelFromJson(json);

  Map<String, dynamic> toJson() => _$DealerMakeModelToJson(this);
}
