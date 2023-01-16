part of 'rent_to_buy_bloc.dart';

class RentToBuyState extends Equatable {
  final String title;
  final String? minimumSumma;
  final String? startingPay;
  final String? month;
  final String? monthlyPay;
  final int step;
  final TextEditingController controller;

  const RentToBuyState({
    required this.step,
    required this.title,
    required this.controller,
    this.month,
    this.monthlyPay,
    this.startingPay,
    this.minimumSumma,
  });

  RentToBuyState copyWith({
    required String title,
    int? step,
    String? startingPay,
    String? month,
    String? monthlyPay,
    String? minimumSumma,
    TextEditingController? controller,
  }) =>
      RentToBuyState(
        controller: controller ?? this.controller,
        title: title,
        step: step ?? this.step,
        month: month ?? this.startingPay,
        monthlyPay: monthlyPay ?? this.month,
        startingPay: startingPay ?? this.monthlyPay,
        minimumSumma: minimumSumma ?? this.minimumSumma,
      );

  @override
  List<Object?> get props => [
        step,
        startingPay,
        month,
        monthlyPay,
        minimumSumma,
        title,
        controller,
      ];
}
