part of 'reviews_bloc.dart';

@Freezed()
class ReviewsEvent with _$ReviewsEvent {
  factory ReviewsEvent.getReviews(ReviewsModel model) = _GetReviews;
}
