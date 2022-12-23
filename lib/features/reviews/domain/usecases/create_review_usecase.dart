import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/domain/model/auto_review_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/reviews/domain/repositories/create_review_repository.dart';

class CreateReviewUseCase extends UseCase<GenericPagination, AutoReviewModel> {
  final CreateReviewRepository repository;

  CreateReviewUseCase({required this.repository});

  @override
  Future<Either<Failure, GenericPagination<AutoReviewModel>>> call(
          AutoReviewModel params) =>
      repository.createReview(model: params);
}
