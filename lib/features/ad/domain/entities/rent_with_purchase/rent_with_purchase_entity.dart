import 'package:auto/features/ad/data/models/rent_with_purchase_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class RentWithPurchaseEntity extends Equatable {
  final int id;
  final String prepayment;
  final int rentalPeriod;
  final String monthlyPayment;

 const  RentWithPurchaseEntity({
    this.id = -1,
    this.monthlyPayment = '',
    this.prepayment = '',
    this.rentalPeriod = -1,
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
