import 'package:equatable/equatable.dart';

class RentWithPurchaseEntity extends Equatable {
  final String prepayment;
  final int rentalPeriod;
  final String monthlyPayment;
  const RentWithPurchaseEntity({
    this.monthlyPayment = '',
    this.prepayment = '',
    this.rentalPeriod = -1,
  });

  @override
  List<Object?> get props => [
        monthlyPayment,
        prepayment,
        rentalPeriod,
      ];
  Map<String, dynamic> toApi() => {
        'prepayment': prepayment,
        'rental_period': rentalPeriod,
        'monthly_payment': monthlyPayment
      };
}
