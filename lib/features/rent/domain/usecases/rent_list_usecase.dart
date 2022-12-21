import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/pagination/repository/pagination.dart';
import 'package:auto/features/rent/data/models/rent_list_model.dart';

class RentListUseCase extends UseCase<GenericPagination<RentListModel>, Params> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<RentListModel>>> call(
      Params params) async {
    final map = <String, dynamic>{'search': params.search};
    if (params.id != null) {
      map.addAll({'rent_car__category': params.id});
    }
    return await repo.fetchMore(
      url: 'rent/list/',
      fromJson: RentListModel.fromJson,
      next: params.next,
      query: map,
    );
  }
}

class Params {
  final String? next;
  final int? id;
  final String? search;

  Params({this.next, this.id, this.search});
}
