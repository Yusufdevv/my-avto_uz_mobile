import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/data/models/district_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/pagination/repository/pagination.dart';

class GetDistrictsUseCase
    extends UseCase<GenericPagination<DistrictModel>, int> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<DistrictModel>>> call(int? params) =>
      repo.fetchMore(
        url: '/common/districts/$params',
        fromJson: DistrictModel.fromJson,
        next: '',
        sendToken: false,
      );
}
