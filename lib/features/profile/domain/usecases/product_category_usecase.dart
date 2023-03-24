import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:auto/features/profile/domain/entities/car_product.dart';
import 'package:auto/features/profile/domain/repositories/profile_repository.dart';

class GetCarProductByCategory extends UseCase<GenericPagination<CarProductEntity>, Params> {
  final ProfileRepository repository = serviceLocator<ProfileRepositoryImpl>();

  GetCarProductByCategory();

  @override
  Future<Either<Failure, GenericPagination<CarProductEntity>>> call(Params params) async =>
      await repository.getCarProductByCategory(params.slug, params.id);
}

class Params {
  final String slug;
  final int id;

  Params({
    required this.slug,
    required this.id,
  });
}
