import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/profile/domain/entities/profile.dart';
import 'package:auto/features/profile/domain/repositories/profile.dart';
import 'package:auto/core/utils/either.dart';

class ProfileUseCase extends UseCase<ProfileEntity, NoParams> {
  final ProfileRepository repository;

  ProfileUseCase({required this.repository});

  @override
  Future<Either<Failure, ProfileEntity>> call(NoParams params) async =>
      await repository.getProfile();
}
