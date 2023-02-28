// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rent_with_purchase_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RentWithPurchaseModel _$RentWithPurchaseModelFromJson(
        Map<String, dynamic> json) =>
    RentWithPurchaseModel(
      id: json['id'] as int? ?? -1,
      monthlyPayment: json['monthly_payment'] as String? ?? '',
      prepayment: json['prepayment'] as String? ?? '',
      rentalPeriod: json['rental_period'] as int? ?? -1,
    );

Map<String, dynamic> _$RentWithPurchaseModelToJson(
        RentWithPurchaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prepayment': instance.prepayment,
      'rental_period': instance.rentalPeriod,
      'monthly_payment': instance.monthlyPayment,
    };
