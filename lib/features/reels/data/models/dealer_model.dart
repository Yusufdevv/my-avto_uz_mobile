import 'package:auto/features/reels/domain/entities/dealer_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dealer_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DealerModel extends DealerEntity {
  const DealerModel({
    required super.id,
    required super.name,
    required super.image,
    required super.slug,
  });

  factory DealerModel.fromJson(Map<String, dynamic> json) =>
      _$DealerModelFromJson(json);

  Map<String, dynamic> toJson() => _$DealerModelToJson(this);
}
