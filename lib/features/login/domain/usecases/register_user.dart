import 'package:auto/core/error/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/common/repository/global_request_repository.dart';
import 'package:auto/features/login/data/models/register.dart';
import 'package:auto/utils/either.dart';

class RegisterUseCase extends UseCase<RegisterModel, RegisterModel> {
  final GlobalRequestRepository repo = GlobalRequestRepository();

  @override
  Future<Either<Failure, RegisterModel>> call(model) => repo.postAndSingle(
      endpoint: '/users/registration/',
      fromJson: RegisterModel.fromJson,
      data: model.toJson());
}
