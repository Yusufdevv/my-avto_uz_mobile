import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/profile/domain/entities/profile_data_entity.dart';
import 'package:auto/features/profile/domain/entities/profile_entity.dart';
import 'package:auto/features/profile/domain/repositories/profile_repository.dart';

class ProfileUseCase extends UseCase<ProfileDataEntity, NoParams> {
  final ProfileRepository repository;

  ProfileUseCase({required this.repository});

  @override
  Future<Either<Failure, ProfileDataEntity>> call(NoParams params) async =>
      await repository.getProfile();
}
