import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/car_single/data/repository/invoice_repository_implemation.dart';
import 'package:auto/features/car_single/domain/repository/invoice_repository.dart';

class GetStatusInvoiceUseCase implements UseCase<String, NoParams> {
  final InvoiceRepository repository = InvoiceRepositoryImplemation();

  GetStatusInvoiceUseCase();

  @override
  Future<Either<Failure, String>> call(NoParams params) async =>
      repository.getInvoiceStatus();
}
