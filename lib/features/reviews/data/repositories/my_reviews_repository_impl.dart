import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/features/common/domain/model/auto_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/reviews/data/datasources/my_reviews_datasource.dart';
import 'package:auto/features/reviews/domain/repositories/my_reviews_repository.dart';
import 'package:auto/utils/either.dart';

class MyReviewsRepositoryImpl extends MyReviewsRepository {
  final MyReviewsDatasource dataSource;
  MyReviewsRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, GenericPagination<AutoModel>>> getMyReviews(
      {String? search}) async {
    try {
      final result = await dataSource.getMyReviews(search: search);
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
