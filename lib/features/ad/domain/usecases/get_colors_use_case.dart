import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';
import 'package:auto/features/common/entities/color_entity.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class GetColorsUseCase
    extends UseCase<GenericPagination<ColorEntity>, String?> {
  final AdRepository repository = serviceLocator<AdRepositoryImpl>();

  GetColorsUseCase();

  @override
  Future<Either<Failure, GenericPagination<ColorEntity>>> call(
          String? params) =>
      repository.getColors(
        next: params,
      );
}
