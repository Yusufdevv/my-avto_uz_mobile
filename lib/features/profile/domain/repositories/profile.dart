import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/features/profile/domain/entities/profile.dart';
import 'package:auto/utils/either.dart';

abstract class ProfileRepository {
  const ProfileRepository();

  Future<Either<ServerFailure, ProfileEntity>> getProfile();

  Future<Either<ServerFailure, ProfileEntity>> editProfile(
      {String? image, String? name, String? surName, int? region});

  Future<Either<ServerFailure, String>> changePassword(
      {required String oldPassword, required String newPassword});
}
