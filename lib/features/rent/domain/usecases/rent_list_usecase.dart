import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/pagination/repository/pagination.dart';
import 'package:auto/features/rent/data/models/rent_list_model.dart';
import 'package:auto/utils/either.dart';

class RentListUseCase extends UseCase<GenericPagination<RentListModel>, Param> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<RentListModel>>> call(
          Param params) async =>
      await repo.fetchMore(
          url: 'rent/list/',
          fromJson: RentListModel.fromJson,
          next: params.next,
          query: params.id != null ? {'rent_car__category': params.id} : null);
}

class Param {
  final String? next;
  final int? id;
  Param({this.next, this.id});
}
