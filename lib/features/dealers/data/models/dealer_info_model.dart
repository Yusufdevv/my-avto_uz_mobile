import 'package:auto/features/dealers/domain/entities/dealer_info_entity.dart';
import 'package:auto/features/dealers/domain/entities/dealer_type_entity.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dealer_info_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DealerSingleModel extends DealerSingleEntity {
  const DealerSingleModel({
    required super.id,
    required super.name,
    required super.slug,
    required super.description,
    required super.dealerType,
    required super.latitude,
    required super.longitude,
    required super.gallery,
    required super.phoneNumber,
    required super.phone,
    required super.address,
    required super.contactTo,
    required super.contactFrom,
    required super.carCount,
    required super.district,
    required super.avatar,
    required super.locationUrl,
  });

  factory DealerSingleModel.fromJson(Map<String, dynamic> json) =>
      _$DealerSingleModelFromJson(json);

  Map<String, dynamic> toJson() => _$DealerSingleModelToJson(this);
}
