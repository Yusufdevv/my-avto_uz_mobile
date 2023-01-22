part of 'rent_to_buy_bloc.dart';

class RentToBuyEvent {
  final int? minimumMonthlyPay;
  final String? prepayment;
  final String? rentalPeriod;
  final String? monthlyPayment;
  final String title;
  final int step;
  TextEditingController controller;
  RentToBuyEvent({
    required this.step,
    required this.title,
    required this.controller,
    this.rentalPeriod,
    this.monthlyPayment,
    this.prepayment,
    this.minimumMonthlyPay,
  });
}
