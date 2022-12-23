import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/features/common/domain/model/auto_review_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/reviews/data/models/reviews_model.dart';
import 'package:auto/utils/either.dart';

abstract class ReviewsRepository {
  Future<Either<Failure, GenericPagination<AutoReviewModel>>> getReviews(
      {ReviewsModel? model});
}
