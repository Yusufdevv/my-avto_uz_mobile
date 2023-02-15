import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart'; 
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/profile/data/repositories/get_user_list_repo_impl.dart';
import 'package:auto/features/profile/domain/entities/my_searches_entity.dart';
import 'package:auto/features/profile/domain/repositories/get_user_list_repo.dart';

class GetMySearchesUseCase extends UseCase<GenericPagination<MySearchesEntity>, String> {
     final GetUserListRepository repository = serviceLocator<GetUserListRepoImpl>();


  GetMySearchesUseCase( );

  @override
  Future<Either<Failure, GenericPagination<MySearchesEntity>>> call(String params) async =>
      await repository.getMySearches(params);
}
