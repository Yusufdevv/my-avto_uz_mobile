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
        name: params.name,
        region: params.region,
        surName: params.surName,
      );
}

class EditProfileParams extends Equatable {
  final String? name;
  final String? surName;
  final int? region;
  final String? image;

  const EditProfileParams({
    this.surName,
    this.image,
    this.region,
    this.name,
  });

  @override
  List<Object?> get props => [name, surName, region, image];
}
