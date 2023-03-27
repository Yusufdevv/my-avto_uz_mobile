
import 'package:auto/features/ad/domain/entities/rent_with_purchase/rent_with_purchase_entity.dart';

class RentWithPurchaseModel extends RentWithPurchaseEntity {
  const RentWithPurchaseModel({
    required super.id,
    required super.monthlyPayment,
    required super.prepayment,
    required super.rentalPeriod,
  });

  factory RentWithPurchaseModel.fromJson(Map<String, dynamic> json) =>
      RentWithPurchaseModel(
        id: json['id'] as int? ?? -1,
        monthlyPayment: double.tryParse(json['monthly_payment'])?.toInt() ?? 0,
        prepayment: double.tryParse(json['prepayment'])?.toInt() ?? 0,
        rentalPeriod: json['rental_period'] ?? 0,
      );
}
