part of 'reviews_bloc.dart';

@Freezed()
class ReviewsState with _$ReviewsState {
  factory ReviewsState({
    @Default(FormzStatus.pure) FormzStatus status,
    @Default([]) List<AutoModel> entity,
    @Default('') String next,
    @Default('') String previous,
    @Default(false) bool fetchMore,
    @Default(0) count,
  }) = _ReviewsState;
}
