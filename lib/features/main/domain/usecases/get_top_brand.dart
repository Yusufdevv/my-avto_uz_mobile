import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/pagination/repository/pagination.dart';
import 'package:auto/features/reviews/data/models/make_model.dart';

class GetTopBrandUseCase extends UseCase<GenericPagination<MakeModel>, String> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<MakeModel>>> call(String? params) =>
      repo.fetchMore(
          url: '/car/makes/top/', next: params, fromJson: MakeModel.fromJson);
}
