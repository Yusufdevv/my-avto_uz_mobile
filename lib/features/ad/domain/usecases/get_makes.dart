import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/data/models/pagination/get_pagination_param_model.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:equatable/equatable.dart';

class GetMakesUseCase
    extends UseCase<GenericPagination<MakeEntity>, GetPaginationParam> {
  final AdRepository repository = serviceLocator<AdRepositoryImpl>();

  GetMakesUseCase();

  @override
  Future<Either<Failure, GenericPagination<MakeEntity>>> call(
          GetPaginationParam params) =>
      repository.getMake(
        name: params.name,
        offset: params.offset,
        limit: params.limit,
        next: params.next,
      );
}
