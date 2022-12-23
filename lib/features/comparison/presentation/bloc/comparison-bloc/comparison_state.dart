part of 'comparison_bloc.dart';

class ComparisonState extends Equatable {
  final List<ComparisonEntity> cars;
  final bool onlyDifferences;
  final bool isSticky;
  const ComparisonState(
      {required this.cars,
      required this.onlyDifferences,
      required this.isSticky});
  ComparisonState copyWith(
          {List<ComparisonEntity>? cars,
          bool? onlyDifferences,
          bool? isSticky}) =>
      ComparisonState(
          cars: cars ?? this.cars,
          onlyDifferences: onlyDifferences ?? this.onlyDifferences,
          isSticky: isSticky ?? this.isSticky);
  @override
  List<Object> get props => [cars, onlyDifferences, isSticky];
}
