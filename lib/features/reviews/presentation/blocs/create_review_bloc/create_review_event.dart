part of 'create_review_bloc.dart';


@Freezed()
class CreateReviewEvent with _$CreateReviewEvent{
  factory CreateReviewEvent.createReview({required AutoReviewModel model}) =_CreateReview;
}