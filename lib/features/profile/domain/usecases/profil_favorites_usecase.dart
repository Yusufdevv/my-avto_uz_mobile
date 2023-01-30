import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/profile/data/repositories/get_user_list_repo_impl.dart';

class GetUserFavoritesMyAdsUseCase
    extends UseCase<GenericPagination<AutoEntity>, Params> {
  GetUserListRepoImpl repository = serviceLocator<GetUserListRepoImpl>();

  GetUserFavoritesMyAdsUseCase();

  @override
  Future<Either<Failure, GenericPagination<AutoEntity>>> call(
          Params params) async =>
      await repository.getProfileFavoritesMyAds(
          url: params.endpoint, next: params.query, moderationStatus: params.moderationStatus);
}

class Params {
  final String? query;
  final String endpoint;
  final String? moderationStatus;
  Params({required this.endpoint, this.query, this.moderationStatus,});
}
