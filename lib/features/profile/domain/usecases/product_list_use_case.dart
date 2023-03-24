import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:auto/features/profile/domain/entities/products_list.dart';
import 'package:auto/features/profile/domain/repositories/profile_repository.dart';

class ProductListUseCase
    extends UseCase<GenericPagination<ProductsList>, String> {
  final ProfileRepository repository = serviceLocator<ProfileRepositoryImpl>();

  ProductListUseCase();

  @override
  Future<Either<Failure, GenericPagination<ProductsList>>> call(
          String params) async =>
      await repository.productList(params);
}
