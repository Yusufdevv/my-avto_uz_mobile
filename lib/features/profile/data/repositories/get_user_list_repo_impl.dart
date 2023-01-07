import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/profile/data/datasources/get_user_lists_datasource.dart';
import 'package:auto/features/profile/domain/repositories/get_user_list_repo.dart';

class GetUserListRepoImpl extends GetUserListRepository {

   final GetUserListDatasourceImpl dataSource;

  GetUserListRepoImpl({required this.dataSource});
  @override
  Future<Either<ServerFailure, List<AutoEntity>>> getProfileFavorites(
      String endpoint) async {
    try {
      final result = await dataSource.getProfileFavorites(endpoint);
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(
          statusCode: error.statusCode, errorMessage: error.errorMessage));
    }
  }
}
