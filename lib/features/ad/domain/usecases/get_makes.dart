import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';
import 'package:auto/features/common/entities/makes_entity.dart';

class GetMakesUseCase extends UseCase<GetMakeEntity, NoParams> {
  final AdRepository repository;

  GetMakesUseCase({required this.repository});

  @override
  Future<Either<Failure, GetMakeEntity>> call(NoParams params) =>
      repository.getMake();
}
