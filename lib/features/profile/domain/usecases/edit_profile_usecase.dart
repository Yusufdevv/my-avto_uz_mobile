import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/profile/domain/entities/profile_entity.dart';
import 'package:auto/features/profile/domain/repositories/profile_repository.dart';
import 'package:equatable/equatable.dart';

class EditProfileUseCase extends UseCase<ProfileEntity, EditProfileParams> {
  final ProfileRepository repository;

  EditProfileUseCase({required this.repository});

  @override
  Future<Either<Failure, ProfileEntity>> call(EditProfileParams params) async =>
      await repository.editProfile(
        image: params.image,
        fullName: params.fullName,
        region: params.region,
      );
}

class EditProfileParams extends Equatable {
  final String? fullName;
  final int? region;
  final String? image;

  const EditProfileParams({
    this.image,
    this.region,
    this.fullName,
  });

  @override
  List<Object?> get props => [fullName, region, image];
}
