import 'package:auto/core/error/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/common/repository/global_request_repository.dart';
import 'package:auto/utils/either.dart';

class ChangePasswordUseCase extends UseCase<String, ChangePassParam> {
  final GlobalRequestRepository repo = GlobalRequestRepository();

  @override
  Future<Either<Failure, String>> call(ChangePassParam params) {
    print(params.phone);
    print(params.validPassword);
    return repo.postAndSingle(
          endpoint: '/users/forget-pass/change-password/',sendToken: false,
          fromJson: (json) => 'rahmat',
          data: {'phone_number': params.phone, 'password': params.validPassword});
  }
}

class ChangePassParam {
  final String phone;
  final String validPassword;

  ChangePassParam({required this.phone, required this.validPassword});
}
