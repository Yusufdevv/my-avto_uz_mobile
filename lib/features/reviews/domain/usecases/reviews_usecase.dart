import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/common/domain/model/auto_review_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/reviews/data/models/reviews_model.dart';
import 'package:auto/features/reviews/domain/repositories/reviews_repository.dart';
import 'package:auto/utils/either.dart';

class ReviewsUseCase extends UseCase<GenericPagination, ReviewsModel> {
  final ReviewsRepository repository;

  ReviewsUseCase({required this.repository});

  @override
  Future<Either<Failure, GenericPagination<AutoReviewModel>>> call(
          ReviewsModel? params) =>
      repository.getReviews(model: params);
}
