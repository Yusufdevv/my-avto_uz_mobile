import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/domain/model/car_make_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

abstract class SuggestionRepository {
  Future<Either<Failure, GenericPagination<CarMakeModel>>> getSuggestions(String text);
}
