import 'package:auto/core/exceptions/failures.dart';

import 'package:auto/core/utils/either.dart';
import 'package:auto/features/dealers/data/models/dealer_single_model.dart';

abstract class DealerSingleRepository {
  Future<Either<Failure, DealerSingleModel>> getDealerSingle(String params);
  Future<Either<Failure, bool>> watchContact({required int id});
}
