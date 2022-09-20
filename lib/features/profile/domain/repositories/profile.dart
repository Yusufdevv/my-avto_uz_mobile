import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/features/profile/domain/entities/profile_item.dart';
import 'package:auto/utils/either.dart';

abstract class ProfileRepository{
  const ProfileRepository();
  Future<Either<ServerFailure, ProfileItemEntity>> getProfile();

}