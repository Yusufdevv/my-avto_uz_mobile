import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/domain/entities/equipment/equipment_options_list_entity.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class GetEquipmentOptionsListUseCase extends UseCase<
    GenericPagination<EquipmentOptionsListEntity>, Map<String, dynamic>> {
  final AdRepository repository = serviceLocator<AdRepositoryImpl>();

  GetEquipmentOptionsListUseCase();

  @override
  Future<Either<Failure, GenericPagination<EquipmentOptionsListEntity>>> call(
          Map<String, dynamic> params) =>
      repository.getEquipmentOptionsList(
        search: params['search'],
        limit: params['limit'],
        offset: params['offset'],
      );
}
