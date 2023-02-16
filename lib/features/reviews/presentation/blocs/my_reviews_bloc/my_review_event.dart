part of 'my_review_bloc.dart';

@Freezed()
class MyReviewsEvent with _$MyReviewsEvent {
  factory MyReviewsEvent.getMyReviews({String? search}) = _GetMyReviews;
}
