import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/car_single/domain/repository/car_single_repository.dart';

class CallCount implements UseCase<dynamic, int> {
  final CarSingleRepository repository;

  CallCount({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(int params) async =>
      repository.callCount(id: params);
}
