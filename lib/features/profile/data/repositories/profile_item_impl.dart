import 'package:auto/core/error/exeptions.dart';
import 'package:auto/core/error/failures.dart';
import 'package:auto/features/profile/domain/entities/profile_item.dart';
import 'package:auto/features/profile/domain/repositories/profile.dart';
import 'package:auto/utils/either.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileRepository profileRepository;

  const ProfileRepositoryImpl({required this.profileRepository});

  @override
  Future<Either<ServerFailure, ProfileItemEntity>> getProfile() => _getProfile();

  Future<Either<ServerFailure, ProfileItemEntity>> _getProfile() async {
    try {
      final result = await profileRepository.getProfile();
      return Right(result.right);
    } on ServerException catch (error) {
      return Left(ServerFailure(
          errorMessage: error.statusMessage, statusCode: error.statusCode));
    }
  }
}
