import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/common/repository/global_request_repository.dart';
import 'package:auto/core/utils/either.dart';

class SendRecoveryCodeUseCase extends UseCase<String, String> {
  final GlobalRequestRepository repo = GlobalRequestRepository();

  @override
  Future<Either<Failure, String>> call(String phone) => repo.postAndSingle(
      sendToken: false,
      endpoint: '/users/forget-pass/sms-verification/entrypoint/',
      fromJson: (data) => data['session'],
      data: {'phone': '+998${phone.replaceAll(' ', '')}'});
}
