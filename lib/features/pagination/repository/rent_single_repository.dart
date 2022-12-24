import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/rent/data/models/rent_list_model.dart';

abstract class RentSingleRepository {
  Future<Either<Failure, RentListModel>> getSingleRent(
      int params);


}
