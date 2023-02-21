import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/domain/entities/equipment/equipment_entity.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class GetEquipmentsUseCase extends UseCase<
    GenericPagination<EquipmentEntity>, Map<String, dynamic>> {
  final AdRepository repository = serviceLocator<AdRepositoryImpl>();

  GetEquipmentsUseCase();

  @override
  Future<Either<Failure, GenericPagination<EquipmentEntity>>> call(
          Map<String, dynamic> params) =>
      repository.getEquipments(
        search: params['search'],
        limit: params['limit'],
        offset: params['offset'],
        modelId: params['modelId'],
      );
}
