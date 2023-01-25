import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/common/domain/model/auto_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/profile/data/repositories/get_user_list_repo_impl.dart';

class GetUserFavoritesMyAdsUseCase extends UseCase<GenericPagination<AutoModel>, String> {
  GetUserListRepoImpl repository = serviceLocator<GetUserListRepoImpl>();

  GetUserFavoritesMyAdsUseCase();

  @override
  Future<Either<Failure, GenericPagination<AutoModel>>> call(String? params) async =>
      await repository.getProfileFavorites(
          url: '/users/wishlist/announcement/list/', next: params);
}
