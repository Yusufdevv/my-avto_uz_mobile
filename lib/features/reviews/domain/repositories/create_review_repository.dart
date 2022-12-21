import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/features/common/domain/model/auto_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/utils/either.dart';

abstract class CreateReviewRepository {
  Future<Either<Failure, GenericPagination<AutoModel>>> createReview(
      {required AutoModel model});
}
