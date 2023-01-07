import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';

abstract class GetUserListRepository {
  const GetUserListRepository();


 
  Future<Either<ServerFailure, List<AutoEntity>>> getProfileFavorites(String endpoint);

}