import 'package:auto/features/ad/data/models/rent_with_purchase_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class RentWithPurchaseEntity extends Equatable {
  final int id;
  final int prepayment;
  final int rentalPeriod;
  final int monthlyPayment;

  const RentWithPurchaseEntity({
    this.id = -1,
    this.monthlyPayment = 0,
    this.prepayment = 0,
    this.rentalPeriod = 0,
  });

  @override
  List<Object?> get props => [
        id,
        monthlyPayment,
        prepayment,
        rentalPeriod,
      ];

  Map<String, dynamic> toApi() => {
        'prepayment': prepayment,
        'rental_period': rentalPeriod,
        'monthly_payment': monthlyPayment,
      };
}

class RentWithPurchaseEntityConverter
    implements JsonConverter<RentWithPurchaseEntity, Map<String, dynamic>?> {
  const RentWithPurchaseEntityConverter();

  @override
  RentWithPurchaseEntity fromJson(Map<String, dynamic>? json) =>
      RentWithPurchaseModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(RentWithPurchaseEntity object) => {};
}
