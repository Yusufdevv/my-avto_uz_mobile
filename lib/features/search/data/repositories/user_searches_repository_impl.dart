import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/search/data/datasources/user_searches_datasource.dart';
import 'package:auto/features/search/data/models/user_searches_model.dart';
import 'package:auto/features/search/domain/repositories/user_searches_repository.dart';

class UserSearchesRepositoryImpl extends UserSearchesRepository {
  final UserSearchesDatasource dataSource = UserSearchesDatasourceImpl();

  UserSearchesRepositoryImpl();

  @override
  Future<Either<Failure, GenericPagination<UserSearchesModel>>> getUserSearches(
      String? search) async {
    try {
      final result = await dataSource.getUserSearches(search);
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
