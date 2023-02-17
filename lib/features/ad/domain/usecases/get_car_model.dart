import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';
import 'package:auto/features/common/entities/makes_entity.dart';

class GetCarModelUseCase extends UseCase<GetMakeEntity, int> {
  final AdRepository repository = serviceLocator<AdRepositoryImpl>();

  GetCarModelUseCase();

  @override
  Future<Either<Failure, GetMakeEntity>> call(int params, {String? name}) =>
      repository.getCarModel(params, name: name);
}
