part of 'marks_in_dealers_bloc.dart';

@Freezed()
class MarksInDealersState with _$MarksInDealersState {
  factory MarksInDealersState({
    @Default([]) List<MarksInDealerEntity> marks,
    @Default(FormzStatus.pure) FormzStatus status,
  }) = _MarksInDealersState;
}