import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/domain/entities/equipment/equipment_options_entity.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class GetEquipmentOptionsUseCase extends UseCase<
    GenericPagination<EquipmentOptionsEntity>, Map<String, dynamic>> {
  final AdRepository repository = serviceLocator<AdRepositoryImpl>();

  GetEquipmentOptionsUseCase();

  @override
  Future<Either<Failure, GenericPagination<EquipmentOptionsEntity>>> call(
          Map<String, dynamic> params) =>
      repository.getEquipmentOptions(
        search: params['search'],
        limit: params['limit'],
        offset: params['offset'],
        equipmentId: params['equipmentId'],
      );
}
