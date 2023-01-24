import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/repository/global_request_repository.dart';

class VerifyCodeUseCase extends UseCase<String, VerifyParam> {
  final GlobalRequestRepository repo = GlobalRequestRepository();

  @override
  Future<Either<Failure, String>> call(VerifyParam params) => repo.postAndSingle(
          endpoint: '/users/registration/sms-verification/verify/',
          sendToken: false,
          errorKey: 'detail',
          fromJson: (data) => data['phone'],
          data: {
            'phone': '+998${params.phone.replaceAll(' ', '')}',
            'code': params.code,
            'session': params.session,
          });
}

class VerifyParam {
  final String phone;
  final String code;
  final String session;

  VerifyParam({required this.phone, required this.code, required this.session});
}
