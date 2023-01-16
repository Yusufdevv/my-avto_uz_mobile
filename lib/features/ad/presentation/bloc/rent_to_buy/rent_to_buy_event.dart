part of 'rent_to_buy_bloc.dart';

class RentToBuyEvent {
  final String? minimumSumma;
  final String? startingPay;
  final String? month;
  final String? monthlyPay;
  final String title;
  final int step;
  RentToBuyEvent(
      {required this.step,
      required this.title,
      this.month,
      this.monthlyPay,
      this.startingPay,
      this.minimumSumma});
}
