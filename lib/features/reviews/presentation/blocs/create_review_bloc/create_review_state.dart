part of 'create_review_bloc.dart';

@Freezed()
class CreateReviewState with _$CreateReviewState {
  factory CreateReviewState({
    @Default(FormzStatus.pure) FormzStatus status,
    @Default([]) List<AutoReviewModel> entity,
    @Default('') String previous,
    @Default('') String next,
    @Default(false) bool fetchMore,
    @Default(0) int count,
  }) = _CreateReviewState;
}
