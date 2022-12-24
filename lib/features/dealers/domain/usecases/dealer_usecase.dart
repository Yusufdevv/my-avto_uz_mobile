import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/dealers/data/models/dealer_card_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/pagination/repository/pagination.dart';
import 'package:auto/core/utils/either.dart';

class DealerUseCase
    extends UseCase<GenericPagination<DealerCardModel>, DealerParams> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<DealerCardModel>>> call(
      DealerParams params) async {
    final map = <String, dynamic>{'search': params.search};
    return await repo.fetchMore(
        url: 'users/dealers/',
        fromJson: DealerCardModel.fromJson,
        next: params.next,
        query: map);
  }
}

class DealerParams {
  final String? next;
  final String? search;

  DealerParams({this.next, this.search});
}
