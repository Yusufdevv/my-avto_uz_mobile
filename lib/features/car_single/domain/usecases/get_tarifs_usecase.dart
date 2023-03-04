import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/car_single/data/repository/invoice_repository_implemation.dart';
import 'package:auto/features/car_single/domain/entities/tarif_entity.dart';
import 'package:auto/features/car_single/domain/repository/invoice_repository.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class GetTarifsUseCase
    implements UseCase<GenericPagination<TarifEntity>, NoParams> {
  final InvoiceRepository repository = InvoiceRepositoryImplemation();

  GetTarifsUseCase();

  @override
  Future<Either<Failure, GenericPagination<TarifEntity>>> call(
          NoParams params) async =>
      repository.getTarifs();
}
