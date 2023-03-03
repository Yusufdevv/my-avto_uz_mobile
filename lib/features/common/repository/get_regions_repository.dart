import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/data/datasources/get_regions_datasource.dart';
import 'package:auto/features/rent/data/models/region_model.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';

// ignore: one_member_abstracts
abstract class GetRegionsRepository {
  Future<Either<Failure, List<RegionEntity>>> getRegions();
}

class GetRegionsRepositoryImpl extends GetRegionsRepository {
  final GetRegionsDatasourse dataSource;

  GetRegionsRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<RegionEntity>>> getRegions() async {
    try {
      final result = await dataSource.getRegions();
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }
}
