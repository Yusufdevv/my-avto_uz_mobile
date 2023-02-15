part of 'rent_to_buy_bloc.dart';

class RentToBuyState extends Equatable {
  final RentWithPurchaseEntity? entityForEdit;
  final FocusNode focusNode;
  final String title;
  final int? minimumSumma;
  final String? prepayment;
  final String? rentalPeriod;
  final String? monthlyPayment;
  final int step;
  final TextEditingController controller;

  const RentToBuyState({
    required this.step,
    required this.title,
    required this.controller,
    required this.focusNode,
    this.rentalPeriod,
    this.entityForEdit,
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
    int? minimumSumma,
    TextEditingController? controller,
    FormzStatus? status,
    FocusNode? focusNode,
  }) =>
      RentToBuyState(
        entityForEdit: entityForEdit,
        focusNode: focusNode ?? this.focusNode,
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
        focusNode,
        step,
        prepayment,
        rentalPeriod,
        monthlyPayment,
        minimumSumma,
        title,
        controller,
        entityForEdit,
      ];
}
