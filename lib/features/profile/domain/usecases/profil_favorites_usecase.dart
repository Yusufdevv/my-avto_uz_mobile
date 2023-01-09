import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/profile/domain/repositories/get_user_list_repo.dart';

class GetUserFavoritesMyAdsUseCase extends UseCase<List<AutoEntity>, String> {
  final GetUserListRepository repository;

  GetUserFavoritesMyAdsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<AutoEntity>>> call(String endpoint) async =>
      await repository.getProfileFavorites(endpoint);
}
