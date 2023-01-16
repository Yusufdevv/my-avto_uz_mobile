import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/dealers/data/datasource/marks_in_dealer_datasource.dart';
import 'package:auto/features/dealers/data/models/marks_with_ads_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

abstract class MarksInDealerRepository {
  Future<Either<Failure, GenericPagination<MarksWithAdsModel>>> getMarks(
      String params);
}

class MarksInDealerRepositoryImpl extends MarksInDealerRepository{
  final MarksInDealerDataSource dataSource;

  MarksInDealerRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, GenericPagination<MarksWithAdsModel>>> getMarks(
      String params) async {
    try {
      final result = await dataSource.getMarks(params: params);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    }
  }
}
