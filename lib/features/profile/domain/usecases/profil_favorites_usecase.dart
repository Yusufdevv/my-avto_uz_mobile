import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/profile/domain/repositories/profile_repository.dart';

class ProfileFavoritesUseCase extends UseCase<List<AutoEntity>, String> {
  final ProfileRepository repository;

  ProfileFavoritesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<AutoEntity>>> call(String endpoint) async =>
      await repository.getProfileFavorites(endpoint);
}
