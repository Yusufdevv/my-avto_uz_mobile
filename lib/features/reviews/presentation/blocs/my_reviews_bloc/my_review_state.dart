part of 'my_review_bloc.dart';

@Freezed()
class MyReviewsState with _$MyReviewsState {
  factory MyReviewsState({
    @Default(FormzStatus.pure) FormzStatus status,
    @Default([]) List<AutoModel> entity,
    @Default('') String previous,
    @Default('') String next,
    @Default(false) bool fetchMore,
    @Default(0) int  count,
  }) = _MyReviewsState;
}
