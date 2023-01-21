part of 'rent_to_buy_bloc.dart';

class RentToBuyState extends Equatable {
  final String title;
  final String? minimumSumma;
  final String? prepayment;
  final String? rentalPeriod;
  final String? monthlyPayment;
  final int step;
  final TextEditingController controller;

  const RentToBuyState({
    required this.step,
    required this.title,
    required this.controller,
    this.rentalPeriod,
    this.monthlyPayment,
    this.prepayment,
    this.minimumSumma,
  });

  RentToBuyState copyWith({
    required String title,
    List<RentWithPurchaseEntity>? conditions,
    int? step,
    String? monthlyPayment,
    String? prepayment,
    String? rentalPeriod,
    String? minimumSumma,
    TextEditingController? controller,
    FormzStatus? status,
  }) =>
      RentToBuyState(
        controller: controller ?? this.controller,
        title: title,
        step: step ?? this.step,
        rentalPeriod: rentalPeriod ?? this.rentalPeriod,
        monthlyPayment: monthlyPayment ?? this.monthlyPayment,
        prepayment: prepayment ?? this.prepayment,
        minimumSumma: minimumSumma ?? this.minimumSumma,
      );

  @override
  List<Object?> get props => [
        step,
        prepayment,
        rentalPeriod,
        monthlyPayment,
        minimumSumma,
        title,
        controller,
      ];
}
