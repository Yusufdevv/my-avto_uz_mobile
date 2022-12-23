import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/profile/data/datasources/profile_datasource.dart';
import 'package:auto/features/profile/domain/entities/favourite_entity.dart';
import 'package:auto/features/profile/domain/entities/profile_entity.dart';
import 'package:auto/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileDataSourceImpl dataSource;

  ProfileRepositoryImpl({required this.dataSource});

  @override
  Future<Either<ServerFailure, ProfileEntity>> getProfile() async {
    try {
      final result = await dataSource.getProfile();
      return Right(result);
    } on ServerException catch (error) {
      return Left(
          ServerFailure(statusCode: 141, errorMessage: error.errorMessage));
    }
  }

  @override
  Future<Either<ServerFailure, ProfileEntity>> editProfile(
      {String? image, String? name, String? surName, int? region}) async {
    try {
      final result = await dataSource.editProfile(
          image: image, name: name, surName: surName, region: region);
      return Right(result);
    } on ServerException catch (error) {
      return Left(
          ServerFailure(statusCode: 141, errorMessage: error.errorMessage));
    }
  }

  @override
  Future<Either<ServerFailure, String>> changePassword(
      {required String oldPassword, required String newPassword}) async {
    try {
      final result = await dataSource.changePassword(
          oldPassword: oldPassword, newPassword: newPassword);
      return Right(result);
    } on ServerException catch (error) {
      return Left(
          ServerFailure(statusCode: 141, errorMessage: error.errorMessage));
    }
  }

  @override
  Future<Either<ServerFailure, List<FavoriteEntity>>> getProfileFavorites() async {
    try {
      final result = await dataSource.getProfileFavorites();
      return Right(result);
    } on ServerException catch (error) {
      return Left(
          ServerFailure(statusCode: 141, errorMessage: error.errorMessage));
    }
  }
  
  @override
  Future<Either<ServerFailure, String>> changePhoneNumber({required String phoneNumber}) async {
  
    try {
      final result = await dataSource.changePhoneNumber(phoneNumber: phoneNumber
          );
      return Right(result);
    } on ServerException catch (error) {
      return Left(
          ServerFailure(statusCode: 141, errorMessage: error.errorMessage));
    }
  }
  
}
