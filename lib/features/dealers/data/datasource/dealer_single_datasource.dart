import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/features/dealers/data/models/dealer_info_model.dart';
import 'package:dio/dio.dart';

class DealerSingleDataSource {
  final Dio _dio;
  DealerSingleDataSource(this._dio);
  Future<DealerSingleModel> getDealerSingle({required String params}) async {
    try {
      final results = await _dio.get('users/dealers/$params/'
          );

      if (results.statusCode! >= 200 && results.statusCode! < 300) {
        return DealerSingleModel.fromJson(results.data);
      } else {
        throw ServerException(
            errorMessage: results.data.toString(),
            statusCode: results.statusCode ?? 0);
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

// class DealerSingleDataSource {
//   final _dio = serviceLocator<DioSettings>().dio;
//   DealerSingleDataSource();
//
//   Future<DealerSingleModel> dealerSingle(
//       {required String params}) async {
//     final token = StorageRepository.getString('token');
//     try {
//       final results = await _dio.get('/user/dealers/$params',
//           options: token.isNotEmpty
//               ? Options(headers: {'Authorization': 'Bearer $token'})
//               : null);
//
//       if (results.statusCode! >= 200 && results.statusCode! < 300) {
//         return DealerSingleModel.fromJson(results.data);
//       } else {
//         throw ServerException(
//             errorMessage: results.data.toString(),
//             statusCode: results.statusCode ?? 0);
//       }
//     } on ServerException {
//       rethrow;
//     } on DioError {
//       throw DioException();
//     } on Exception catch (e) {
//       throw ParsingException(errorMessage: e.toString());
//     }
//   }
// }
