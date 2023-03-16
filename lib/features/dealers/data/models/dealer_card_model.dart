import 'package:auto/features/dealers/domain/entities/dealer_card_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';

part 'dealer_card_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DealerCardModel extends DealerCardEntity {
  const DealerCardModel({
    required super.id,
    required super.name,
    required super.slug,
    required super.description,
    required super.phoneNumber,
    required super.avatar,
    required super.contactFrom,
    required super.contactTo,
    required super.locationUrl,
    required super.longitude,
    required super.latitude,
    required super.carCount,
    required super.district,
    required super.address,
    required super.isWorkingAllDays,
    required super.workingDays,
  });

  factory DealerCardModel.fromJson(Map<String, dynamic> json) =>
      _$DealerCardModelFromJson(json);

  Map<String, dynamic> toJson() => _$DealerCardModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class WorkingDaysModel extends WorkingDays {
  const WorkingDaysModel({
    required super.dayOfWeek,
  });
  factory WorkingDaysModel.fromJson(Map<String, dynamic> json) =>
      _$WorkingDaysModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkingDaysModelToJson(this);
}
