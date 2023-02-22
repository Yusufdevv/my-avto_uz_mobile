import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/domain/entities/equipment/gas_equipment_entity.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class GetGasEquipmentsUseCase extends UseCase<
    GenericPagination<GasEquipmentEntity>, Map<String, dynamic>> {
  final AdRepository repository = serviceLocator<AdRepositoryImpl>();

  GetGasEquipmentsUseCase();

  @override
  Future<Either<Failure, GenericPagination<GasEquipmentEntity>>> call(
          Map<String, dynamic> params) =>
      repository.getGasEquipments(
        search: params['search'],
        limit: params['search'],
        offset: params['offset'],
      );
}
