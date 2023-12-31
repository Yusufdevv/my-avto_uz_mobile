import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/car_single/data/repository/invoice_repository_implemation.dart';
import 'package:auto/features/car_single/domain/entities/payment_entity.dart';
import 'package:auto/features/car_single/domain/repository/invoice_repository.dart';

class PayInvoiceUseCase implements UseCase<PaymentEntity, Map<String, dynamic>> {
  final InvoiceRepository repository = InvoiceRepositoryImplemation();

  PayInvoiceUseCase();

  @override
  Future<Either<Failure, PaymentEntity>> call(Map<String, dynamic> params) async =>
      repository.payInvoice(params);
}
