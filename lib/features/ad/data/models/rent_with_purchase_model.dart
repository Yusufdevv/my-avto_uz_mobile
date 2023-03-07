import 'package:auto/features/ad/domain/entities/rent_with_purchase/rent_with_purchase_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rent_with_purchase_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RentWithPurchaseModel extends RentWithPurchaseEntity {
  const RentWithPurchaseModel({
    required super.id,
    required super.monthlyPayment,
    required super.prepayment,
    required super.rentalPeriod,
  });

  factory RentWithPurchaseModel.fromJson(Map<String, dynamic> json) =>
      _$RentWithPurchaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RentWithPurchaseModelToJson(this);
}
