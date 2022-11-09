
// import 'package:auto/core/exceptions/failures.dart';
// import 'package:auto/core/singletons/dio_settings.dart';
// import 'package:auto/core/singletons/service_locator.dart';
// import 'package:auto/features/search/data/models/search_item.dart';
// import 'package:auto/utils/either.dart';

// class SearchRepository {
//   final client = serviceLocator<DioSettings>().dio;

//   Future<Either<Failure, List<SearchItemModel>>> getSearchAds() async {
//     try {
//       final result = await client.get('es/Announcements/');

//       if (result.statusCode! >= 200 && result.statusCode! < 300) {
//         var data = (result.data as List<dynamic>)
//             .map((e) => SearchItemModel.fromJson(e))
//             .toList();
//         return Right(data);
//       }
//     } catch (e) {
//       print(e.toString());
//       return Left(ServerFailure());
//     }
//   }
// }
