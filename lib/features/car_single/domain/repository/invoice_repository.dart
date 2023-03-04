
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/car_single/domain/entities/payment_entity.dart';
import 'package:auto/features/car_single/domain/entities/tarif_entity.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

abstract class InvoiceRepository{
  Future<Either<Failure, GenericPagination<TarifEntity>>> getTarifs();
  Future<Either<Failure, PaymentEntity>> payInvoice(Map<String, dynamic> params);
  Future<Either<Failure, String>> getInvoiceStatus();
}