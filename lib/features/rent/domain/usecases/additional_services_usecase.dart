import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/pagination/repository/pagination.dart';
import 'package:auto/features/rent/data/models/additional_service_model.dart';
import 'package:auto/features/rent/domain/usecases/rent_list_usecase.dart';

class AdditionalServiceUseCase
    extends UseCase<GenericPagination<AdditionalServiceModel>, Params> {
  final PaginationRepository repo = PaginationRepository();
  @override
  Future<Either<Failure, GenericPagination<AdditionalServiceModel>>> call(
      Params params) async {
    final response = await repo.fetchMore(
      url: '/rent/additional-service/',
      fromJson: AdditionalServiceModel.fromJson,
      next: params.next,
      query: {},
    );
    
    return response;
  }
}
