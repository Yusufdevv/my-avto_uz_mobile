import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:auto/features/profile/domain/entities/terms_of_use_entity.dart';
import 'package:auto/features/profile/domain/repositories/profile_repository.dart';

class GetTermsOfUseUseCase extends UseCase< TermsOfUseEntity , String> {
  final ProfileRepository repository = serviceLocator<ProfileRepositoryImpl>();

  GetTermsOfUseUseCase( );

  @override
  Future<Either<Failure,  TermsOfUseEntity >> call(String  params) async =>
      await repository.getTermsOfUse(params);
}