part of 'comparison_add_bloc.dart';

@Freezed()
class ComparisonAddState with _$ComparisonAddState {
  factory ComparisonAddState({
    @Default(FormzStatus.pure) FormzStatus addStatus,
    @Default(FormzStatus.pure) FormzStatus removeStatus,
  }) = _ComparisonAddState;
}
