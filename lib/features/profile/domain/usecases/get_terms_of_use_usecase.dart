import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/profile/domain/entities/terms_of_use_entity.dart';
import 'package:auto/features/profile/domain/repositories/profile_repository.dart';

class GetTermsOfUseUseCase extends UseCase<List<TermsOfUseEntity>, NoParams> {
  final ProfileRepository repository;

  GetTermsOfUseUseCase({required this.repository});

  @override
  Future<Either<Failure, List<TermsOfUseEntity>>> call(NoParams params) async =>
      await repository.getTermsOfUse();
}