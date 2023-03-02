import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/repository/get_regions_repository.dart';
import 'package:auto/features/rent/data/models/region_model.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';

class GetRegionsUseCase extends UseCase<List<RegionEntity>, NoParams> {
  final GetRegionsRepository repo = serviceLocator<GetRegionsRepositoryImpl>();

  @override
  Future<Either<Failure, List<RegionEntity>>> call(NoParams params) =>
      repo.getRegions();
}
