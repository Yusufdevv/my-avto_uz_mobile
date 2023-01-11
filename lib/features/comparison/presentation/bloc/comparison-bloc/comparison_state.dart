part of 'comparison_bloc.dart';

class ComparisonState extends Equatable {
  final List<ComparisonEntity> cars;
  final bool onlyDifferences;
  final FormzStatus status;
  final bool isSticky;
  const ComparisonState(
      {required this.cars,
      required this.onlyDifferences,
      required this.isSticky,required this.status,});
  ComparisonState copyWith(
          {List<ComparisonEntity>? cars,
          bool? onlyDifferences,
          bool? isSticky,FormzStatus? status,}) =>
      ComparisonState(
          cars: cars ?? this.cars,
          onlyDifferences: onlyDifferences ?? this.onlyDifferences,
          isSticky: isSticky ?? this.isSticky,
          status: status ?? this.status);
  @override
  List<Object> get props => [status,cars, onlyDifferences, isSticky];
}
