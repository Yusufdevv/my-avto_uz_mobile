import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/profile/data/models/product_category.dart';
import 'package:auto/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:auto/features/profile/domain/repositories/profile_repository.dart';

class ProductCategoryUseCase
    extends UseCase<GenericPagination<ProductCategoryModel>, String> {
  final ProfileRepository repository = serviceLocator<ProfileRepositoryImpl>();

  ProductCategoryUseCase();

  @override
  Future<Either<Failure, GenericPagination<ProductCategoryModel>>> call(
          String params) async =>
      await repository.productCategory(params);
}
