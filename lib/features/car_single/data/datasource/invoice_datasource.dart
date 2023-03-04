import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/car_single/data/model/tarif_model.dart';
import 'package:auto/features/car_single/domain/entities/payment_entity.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:dio/dio.dart';

abstract class InvoiceDatasource {
  Future<GenericPagination<TarifModel>> getTarifs();
  Future<PaymentEntity> payInvoice(Map<String, dynamic> params);
  Future<String> getInvoiceStatus();
}

class InvoiceDatasourceImplemation extends InvoiceDatasource{
  final _dio = serviceLocator<DioSettings>().dio;
  @override
  Future<String> getInvoiceStatus() async {
    try {
      final response = await _dio.get('',
          options: Options(headers: {
            'Authorization': 'Bearer ${StorageRepository.getString('token')}'
          }));
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return response.data.toString();
      }
      if (response.data is Map) {
        throw ServerException(
            statusCode: response.statusCode!,
            errorMessage: ((response.data as Map).values.isNotEmpty
                ? (response.data as Map).values.first
                : 'Error')
                .toString());
      } else {
        throw ServerException(
            statusCode: response.statusCode!,
            errorMessage: response.data.toString());
      }
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<GenericPagination<TarifModel>> getTarifs() async {
    try {
      final response = await _dio.get('payment/tariff/',
          options: Options(headers: {
            'Authorization': 'Bearer ${StorageRepository.getString('token')}'
          }));
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
                (p0) => TarifModel.fromJson(p0 as Map<String, dynamic>));
      }
      if (response.data is Map) {
        throw ServerException(
            statusCode: response.statusCode!,
            errorMessage: ((response.data as Map).values.isNotEmpty
                ? (response.data as Map).values.first
                : 'Error')
                .toString());
      } else {
        throw ServerException(
            statusCode: response.statusCode!,
            errorMessage: response.data.toString());
      }
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<PaymentEntity> payInvoice(Map<String, dynamic> params) async {
    try {
      final response = await _dio.post('payment/create-announcement-order/',
          data: params,
          options: Options(headers: {
            'Authorization': 'Bearer ${StorageRepository.getString('token')}'
          }));
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return  PaymentEntity.fromJson(response.data as Map<String, dynamic>);
      }
      if (response.data is Map) {
        throw ServerException(
            statusCode: response.statusCode!,
            errorMessage: ((response.data as Map).values.isNotEmpty
                ? (response.data as Map).values.first
                : 'Error')
                .toString());
      } else {
        throw ServerException(
            statusCode: response.statusCode!,
            errorMessage: response.data.toString());
      }
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

}

