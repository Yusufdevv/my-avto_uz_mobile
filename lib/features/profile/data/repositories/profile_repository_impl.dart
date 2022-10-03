import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:auto/features/profile/domain/entities/profile.dart';
import 'package:auto/features/profile/domain/repositories/profile.dart';
import 'package:auto/utils/either.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileRemoteDataSource dataSource;

  ProfileRepositoryImpl({required this.dataSource});

  @override
  Future<Either<ServerFailure, ProfileEntity>> getProfile() async {
    try {
      final result = await dataSource.getProfile();
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(statusCode: 141, errorMessage: error.errorMessage));
    }
  }
}
