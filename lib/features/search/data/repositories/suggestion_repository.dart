import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/domain/model/car_make_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/search/data/datasources/suggestion_datasource.dart';
import 'package:auto/features/search/domain/repositories/suggestion_repository.dart';

class SuggestionRepositoryImpl extends SuggestionRepository {
  final SuggestionDatasource dataSource;

  SuggestionRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, GenericPagination<CarMakeModel>>> getSuggestions(String text) async {
    try {
      final result = await dataSource.getSuggestions(text);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }
}
