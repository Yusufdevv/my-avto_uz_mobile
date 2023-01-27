import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/common/repository/get_regions_repository.dart'; 

class GetRegionsUseCase extends UseCase<List<Region>, NoParams> {
  final GetRegionsRepository repo = serviceLocator<GetRegionsRepositoryImpl>();

  @override
  Future<Either<Failure, List<Region>>> call(NoParams params) => repo.getRegions() ;
      
}
