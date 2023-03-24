import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class GetCarModelUseCase extends UseCase<GenericPagination<MakeEntity>, int> {
  final AdRepository repository = serviceLocator<AdRepositoryImpl>();

  GetCarModelUseCase();

  @override
  Future<Either<Failure, GenericPagination<MakeEntity>>> call(int params,
          {String? name, String? next}) =>
      repository.getCarModel(params, name: name, next: next);
}
