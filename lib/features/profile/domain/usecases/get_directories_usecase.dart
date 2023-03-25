import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/profile/data/repositories/get_user_list_repo_impl.dart';
import 'package:auto/features/profile/domain/entities/directory_entity.dart';
import 'package:auto/features/profile/domain/repositories/get_user_list_repo.dart';

class GetDirectoriesUseCase extends UseCase<GenericPagination<DirectoryEntity>, Params> {
  final GetUserListRepository repository = serviceLocator<GetUserListRepoImpl>();

  GetDirectoriesUseCase();

  @override
  Future<Either<Failure, GenericPagination<DirectoryEntity>>> call(Params params) async {
   final res =   await repository.getDirectories(
          params.search, params.regions, params.categories, params.next);
   return res;
  }
}

class Params {
  String search;
  String regions;
  String categories;
  String? next;

  Params({
    required this.search,
    required this.regions,
    required this.categories,
     this.next,
  });
}
