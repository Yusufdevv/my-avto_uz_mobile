import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';

class VerifyContactsUseCase extends UseCase<bool, Map<String, String>> {
  final AdRepository repository;
  VerifyContactsUseCase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(Map<String, String> params) =>
      repository.verify(params: params);
}
