import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/profile/domain/entities/profile_data_entity.dart';
import 'package:auto/features/profile/domain/entities/profile_entity.dart';
import 'package:auto/features/profile/domain/entities/terms_of_use_entity.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileDataEntity>> getProfile();

  Future<Either<Failure, ProfileEntity>> editProfile(
      {String? image, String? fullName, int? region, String? email});

  Future<Either<Failure, String>> changePassword(
      {required String oldPassword, required String newPassword});

  Future<Either<Failure, String>> sendPhoneNumber(
      {required String phoneNumber});

  Future<Either<Failure, String>> sendVerificationCode(
      {required String phoneNumber,
      required String code,
      required String session});

  Future<Either<Failure, TermsOfUseEntity>> getTermsOfUse(String slug);
}
