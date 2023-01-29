
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/dealers/data/models/cars_in_dealer_model.dart';
import 'package:auto/features/dealers/data/models/dealer_info_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

abstract class UserSingleRepository {

  Future<Either<Failure, GenericPagination<CarsInDealerModel>>> getUserAds(
      String params);

        Future<Either<Failure, DealerSingleModel>> getUserSingle(
      String params);
}
