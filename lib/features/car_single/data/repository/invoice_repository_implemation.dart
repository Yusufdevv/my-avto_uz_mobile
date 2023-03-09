import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/car_single/data/datasource/invoice_datasource.dart';
import 'package:auto/features/car_single/domain/entities/tarif_entity.dart';
import 'package:auto/features/car_single/domain/repository/invoice_repository.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

import '../../domain/entities/payment_entity.dart';

class InvoiceRepositoryImplemation extends InvoiceRepository{
  final InvoiceDatasource datasource = InvoiceDatasourceImplemation();
  @override
  Future<Either<Failure, String>> getInvoiceStatus(int orderId) async{
    try {
      final result = await datasource.getInvoiceStatus(orderId);
      return Right(result);
    } on DioException{
      return Left(DioFailure());
    } on ParsingException catch(e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, GenericPagination<TarifEntity>>> getTarifs() async {
    try {
      final result = await datasource.getTarifs();
      return Right(result);
    } on DioException{
      return Left(DioFailure());
    } on ParsingException catch(e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, PaymentEntity>> payInvoice(Map<String, dynamic> params) async {
    try {
      final result = await datasource.payInvoice(params);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

}