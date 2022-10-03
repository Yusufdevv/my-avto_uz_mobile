import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/pagination/repository/pagination.dart';
import 'package:auto/features/rent/data/models/rent_list_model.dart';
import 'package:auto/utils/either.dart';

class RentListUseCase
    extends UseCase<GenericPagination<RentListModel>, String> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<RentListModel>>> call(
          String params) async =>
      await repo.fetchMore(
        url: 'rent/list/',
        fromJson: RentListModel.fromJson,
        next: params,
      );
}
