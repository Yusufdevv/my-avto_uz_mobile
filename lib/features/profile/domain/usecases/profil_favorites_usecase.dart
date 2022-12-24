import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/profile/domain/entities/favourite_entity.dart';
import 'package:auto/features/profile/domain/repositories/profile_repository.dart';

class ProfileFavoritesUseCase extends UseCase<List<FavoriteEntity>, NoParams> {
  final ProfileRepository repository;

  ProfileFavoritesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<FavoriteEntity>>> call(NoParams params) async =>
      await repository.getProfileFavorites();
}
