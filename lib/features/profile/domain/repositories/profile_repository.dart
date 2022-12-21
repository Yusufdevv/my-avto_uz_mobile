import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/profile/domain/entities/favourite_entity.dart';
import 'package:auto/features/profile/domain/entities/profile_entity.dart';

abstract class ProfileRepository {
  const ProfileRepository();

  Future<Either<ServerFailure, ProfileEntity>> getProfile();

  Future<Either<ServerFailure, ProfileEntity>> editProfile(
      {String? image, String? name, String? surName, int? region});

  Future<Either<ServerFailure, String>> changePassword(
      {required String oldPassword, required String newPassword});

  Future<Either<ServerFailure, List<FavoriteEntity>>> getProfileFavorites();

}
