part of 'rent_to_buy_bloc.dart';

class RentToBuyEvent {
  final String? minimumSumma;
  final String? startingPay;
  final String? month;
  final String? monthlyPay;
  final String title;
  final int step;
  TextEditingController controller;
  RentToBuyEvent({
    required this.step,
    required this.title,
    required this.controller,
    this.month,
    this.monthlyPay,
    this.startingPay,
    this.minimumSumma,
  });
}
