import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/car_single/data/model/car_single_model.dart';
import 'package:auto/features/car_single/data/model/other_ads_model.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:dio/dio.dart';

abstract class CarSingleDataSource {
  Future<CarSingleModel> getCarAds();

  Future<OtherAdsModel> getOtherAds();

  Future<CarSingleModel> payInvoice();
}

class CarSinglenDataSourceImpl extends CarSingleDataSource {
  final Dio _dio;

  CarSinglenDataSourceImpl(this._dio);

  @override
  Future<CarSingleModel> getCarAds() async {
    try {
      final response = await _dio.get('',
          options: Options(headers: {
            'Authorization': 'Token ${StorageRepository.getString('token')}'
          }));
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return CarSingleModel.fromJson(response.data);
      } else {
        await StorageRepository.deleteString('token');
      }
      if (response.data is Map) {
        throw ServerException(
            statusCode: response.statusCode!,
            errorMessage: ((response.data as Map).values.isNotEmpty
                    ? (response.data as Map).values.first
                    : 'Error get CarAds')
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
  Future<OtherAdsModel> getOtherAds() {
    // TODO: implement getOtherAds
    throw UnimplementedError();
  }

  @override
  Future<CarSingleModel> payInvoice() {
    // TODO: implement payInvoice
    throw UnimplementedError();
  }
}
