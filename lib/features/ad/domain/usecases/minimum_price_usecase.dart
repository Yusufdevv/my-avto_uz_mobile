import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';

class GetMinimumPriceUseCase extends UseCase<num, Map<String, dynamic>> {
  final AdRepository repository = serviceLocator<AdRepositoryImpl>();

  GetMinimumPriceUseCase();

  @override
  Future<Either<Failure, num>> call(Map<String, dynamic> params) =>
      repository.getMinimumPrice(params: params);
}
