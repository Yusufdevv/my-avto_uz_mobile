import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/pagination/repository/pagination.dart';
import 'package:auto/features/rent/data/models/rent_main_model.dart';
import 'package:auto/utils/either.dart';

class RentUseCase extends UseCase<GenericPagination<RentMainModel>, Param> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<RentMainModel>>> call(
          Param params) async =>
      await repo.fetchMore(
        url: 'rent/main_page/${params.id}/',
        fromJson: RentMainModel.fromJson,
        next: params.next,
      );
}

class Param {
  final String next;
  final int id;
  Param({
    this.next = '',
    this.id = 0,
  });
}
