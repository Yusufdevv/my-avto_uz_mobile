import 'package:auto/features/dealers/domain/entities/dealer_info_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dealer_info_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DealerInfoModel extends DealerInfoEntity {
  DealerInfoModel(
      {required super.additionalInfo,
      required super.contact,
      required super.dealerImageUrl,
      required super.dealerName,
      required super.dealerType,
      required super.latitude,
      required super.longitude,
      required super.quantityOfCars,
      required super.workingHours});
  factory DealerInfoModel.fromJson(Map<String, dynamic> json) =>
      _$DealerInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$DealerInfoModelToJson(this);
}
