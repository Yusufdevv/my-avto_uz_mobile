import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/dealers/data/models/cars_in_dealer_model.dart';
import 'package:auto/features/dealers/data/repositories/cars_in_dealers_repository.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class CarsInDealerUseCase extends UseCase<GenericPagination<CarsInDealerModel>, Params> {
  final CarsInDealerRepository cars;
  CarsInDealerUseCase({required this.cars});

  @override
  Future<Either<Failure, GenericPagination<CarsInDealerModel>>> call(Params params) async =>
      cars.getCars(slug: params.slug, next: params.next);
}

class Params {
  final String slug;
  final String? next;

  Params ({required this.slug, this.next});
}