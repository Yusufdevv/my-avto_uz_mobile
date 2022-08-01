import 'package:auto/core/error/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/profile/domain/entities/profile_item.dart';
import 'package:auto/features/profile/domain/repositories/profile.dart';
import 'package:auto/utils/either.dart';

class GetProfileUseCase extends UseCase<ProfileItemEntity, NoParams> {
  final ProfileRepository sectionSimpleRepository;
  GetProfileUseCase({required this.sectionSimpleRepository});

  @override
  Future<Either<Failure, ProfileItemEntity>> call(NoParams params) async =>
      await sectionSimpleRepository.getProfile();
}
