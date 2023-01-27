import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/profile/domain/entities/profile_data_entity.dart';
import 'package:auto/features/profile/domain/entities/profile_entity.dart';
import 'package:auto/features/profile/domain/entities/terms_of_use_entity.dart';

abstract class ProfileRepository {

  Future<Either<ServerFailure, ProfileDataEntity>> getProfile();

  Future<Either<ServerFailure, ProfileEntity>> editProfile(
      {String? image, String? fullName, int? region});

  Future<Either<ServerFailure, String>> changePassword(
      {required String oldPassword, required String newPassword});

  Future<Either<ServerFailure, String>> sendPhoneNumber(
      {required String phoneNumber});

  Future<Either<ServerFailure, String>> sendVerificationCode({required String phoneNumber, required String code,required String session});

  Future<Either<ServerFailure,  TermsOfUseEntity >> getTermsOfUse(String slug);
}
