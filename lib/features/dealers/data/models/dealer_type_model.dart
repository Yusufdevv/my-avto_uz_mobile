import 'package:auto/features/dealers/domain/entities/dealer_type_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'dealer_type_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DealerTypeModel extends DealerTypeEntity {
  const DealerTypeModel({
    required super.id,
    required super.name,
  });

  factory DealerTypeModel.fromJson(Map<String, dynamic> json) =>
      _$DealerTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$DealerTypeModelToJson(this);
}
