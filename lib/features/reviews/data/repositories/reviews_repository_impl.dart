import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/features/common/domain/model/auto_review_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/reviews/data/datasources/reviews_datasource.dart';
import 'package:auto/features/reviews/data/models/reviews_model.dart';
import 'package:auto/features/reviews/domain/repositories/reviews_repository.dart';
import 'package:auto/utils/either.dart';

class ReviewsRepositoryImpl extends ReviewsRepository {
  final ReviewsDatasource dataSource;
  ReviewsRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, GenericPagination<AutoReviewModel>>> getReviews(
      {ReviewsModel? model}) async {
    try {
      final result = await dataSource.getReviews(model: model);
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
