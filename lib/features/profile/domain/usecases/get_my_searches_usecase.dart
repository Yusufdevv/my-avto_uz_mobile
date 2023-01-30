import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/profile/data/repositories/get_user_list_repo_impl.dart';
import 'package:auto/features/profile/domain/entities/my_searches_entity.dart';
import 'package:auto/features/profile/domain/repositories/get_user_list_repo.dart';

class GetMySearchesUseCase extends UseCase<List<MySearchesEntity>, NoParams> {
     final GetUserListRepository repository = serviceLocator<GetUserListRepoImpl>();


  GetMySearchesUseCase( );

  @override
  Future<Either<Failure, List<MySearchesEntity>>> call(NoParams params) async =>
      await repository.getMySearches();
}
