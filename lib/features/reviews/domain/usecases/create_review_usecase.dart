import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/common/domain/model/auto_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/reviews/domain/repositories/create_review_repository.dart';
import 'package:auto/utils/either.dart';

class CreateReviewUseCase extends UseCase<GenericPagination, AutoModel> {
  final CreateReviewRepository repository;

  CreateReviewUseCase({required this.repository});

  @override
  Future<Either<Failure, GenericPagination<AutoModel>>> call(
          AutoModel params) =>
      repository.createReview(model: params);
}
