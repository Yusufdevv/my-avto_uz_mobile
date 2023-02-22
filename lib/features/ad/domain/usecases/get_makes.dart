import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';
import 'package:auto/features/common/entities/makes_entity.dart';

class GetMakesUseCase extends UseCase<GetMakeEntity, String?> {
  final AdRepository repository = serviceLocator<AdRepositoryImpl>();

  GetMakesUseCase();

  @override
  Future<Either<Failure, GetMakeEntity>> call(String? params) =>
      repository.getMake(name: params);
}
