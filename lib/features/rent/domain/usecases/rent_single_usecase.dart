import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/pagination/repository/rent_single_repository.dart';
import 'package:auto/features/rent/data/models/rent_list_model.dart';

class RentSingleUseCase extends UseCase<RentListModel, int> {
  final RentSingleRepository repo;
  RentSingleUseCase({required this.repo});

  @override
  Future<Either<Failure, RentListModel>> call(int params) async =>
      repo.getSingleRent(params);
}
