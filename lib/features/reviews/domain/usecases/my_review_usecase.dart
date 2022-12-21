import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/common/domain/model/auto_review_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/reviews/domain/repositories/my_reviews_repository.dart';
import 'package:auto/utils/either.dart';


class MyReviewsUseCase extends UseCase<GenericPagination, String> {
  final MyReviewsRepository repository;

  MyReviewsUseCase({required this.repository});

  @override
  Future<Either<Failure, GenericPagination<AutoReviewModel>>> call(String? params) => repository.getMyReviews(search: params);
}