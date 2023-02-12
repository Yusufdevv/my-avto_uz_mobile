part of 'comparison_add_bloc.dart';

@Freezed()
class ComparisonAddState with _$ComparisonAddState {
  factory ComparisonAddState({
    @Default(FormzStatus.pure) FormzStatus addStatus,
    @Default(FormzStatus.pure) FormzStatus removeStatus,
    @Default(0) int count,
  }) = _ComparisonAddState;
}
