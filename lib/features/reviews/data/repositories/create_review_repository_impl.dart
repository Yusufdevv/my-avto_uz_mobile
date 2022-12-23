import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/features/common/domain/model/auto_review_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/reviews/data/datasources/create_review_datasource.dart';
import 'package:auto/features/reviews/domain/repositories/create_review_repository.dart';
import 'package:auto/utils/either.dart';

class CreateReviewRepositoryImpl extends CreateReviewRepository {
  final CreateReviewDatasource dataSource;
  CreateReviewRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, GenericPagination<AutoReviewModel>>> createReview(
      {required AutoReviewModel model}) async {
    try {
      final result = await dataSource.createReview(model);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    }
  }
}
