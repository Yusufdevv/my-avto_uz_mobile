import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/dealers/data/datasource/cars_in_marks_datasource.dart';
import 'package:auto/features/dealers/data/models/cars_in_marks_model.dart';
import 'package:auto/features/dealers/data/repositories/cars_in_marks_repository.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class CarsInMarksUseCase extends UseCase<GenericPagination<CarsInMarksModel>, CarMarkParams> {
  final CarsInMarksRepository cars;
  CarsInMarksUseCase({required this.cars});

  @override
  Future<Either<Failure, GenericPagination<CarsInMarksModel>>> call(CarMarkParams params) async =>
      cars.getCars(params);
}