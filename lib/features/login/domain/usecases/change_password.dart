import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/repository/global_request_repository.dart';

class ChangePasswordInLoginUseCase extends UseCase<String, ChangePassParam> {
  final GlobalRequestRepository repo = GlobalRequestRepository();

  @override
  Future<Either<Failure, String>> call(ChangePassParam params) =>
      repo.postAndSingle(
          endpoint: '/users/forget-pass/change-password/',
          sendToken: false,
          fromJson: (json) => json[''],
          data: {
            'phone_number': params.phone,
            'password': params.validPassword
          });
}

class ChangePassParam {
  final String phone;
  final String validPassword;

  ChangePassParam({required this.phone, required this.validPassword});
}
