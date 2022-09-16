import 'package:auto/core/error/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/common/repository/global_request_repository.dart';
import 'package:auto/utils/either.dart';

class SendCodeUseCase extends UseCase<String, String> {
  final GlobalRequestRepository repo = GlobalRequestRepository();

  @override
  Future<Either<Failure, String>> call(String phone) => repo.postAndSingle(sendToken: false,
      endpoint: '/users/registration/sms-verification/entrypoint/',
      fromJson: (data) => data['session'],
      data: {'phone': '+998${phone.replaceAll(' ', '')}'});
}
