import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/pagination/repository/pagination.dart';
import 'package:auto/features/rent/data/models/rent_main_model.dart';
import 'package:auto/utils/either.dart';

class RentUseCase extends UseCase<GenericPagination<RentMainModel>, String> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<RentMainModel>>> call(
          String params) async =>
      await repo.fetchMore(
        url: 'rent/main_page/rent-cars-by-category/',
        fromJson: RentMainModel.fromJson,
        next: params,
      );
}
