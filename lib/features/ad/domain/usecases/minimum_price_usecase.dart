import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';

class GetMinimumPriceUseCase extends UseCase<String, Map<String, dynamic>> {
  final AdRepository repository;
  GetMinimumPriceUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(Map<String, dynamic> params) =>
      repository.getMinimumPrice(params: params);
}
