import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/dealers/data/datasource/user_search_datasource.dart';
import 'package:auto/features/dealers/data/models/user_search_model.dart';
import 'package:auto/features/dealers/domain/repositories/user_search_repository.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class UserSearchRepositoryImpl extends UserSearchRepository {
  final UserSearchDatasource dataSource;

  UserSearchRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, GenericPagination<UserSearchDealerModel>>>
      getUserSearches(String? search) async {
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
