import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/dealers/data/datasource/marks_in_dealer_datasource.dart';
import 'package:auto/features/dealers/data/models/marks_with_ads_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

// ignore: one_member_abstracts
abstract class MarksInDealerRepository {
  Future<Either<Failure, GenericPagination<MarksWithAdsModel>>> getMarks(
      {required String slug, String? next});
}

class MarksInDealerRepositoryImpl extends MarksInDealerRepository{
  final MarksInDealerDataSource dataSource;

  MarksInDealerRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, GenericPagination<MarksWithAdsModel>>> getMarks(
      {required String slug, String? next}) async {
    try {
      final result = await dataSource.getMarks(slug: slug, next: next);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    }
  }
}
