import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/profile/domain/repositories/profile_repository.dart';
import 'package:equatable/equatable.dart';

class SendSmsVerificationUseCase
    extends UseCase<String, SmsVerificationParams> {
  final ProfileRepository repository;

  SendSmsVerificationUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(SmsVerificationParams params) async =>
      await repository.sendVerificationCode(phoneNumber: params.phoneNumber, code: params.code, session: params.session);
}

class SmsVerificationParams extends Equatable {
  final String phoneNumber;
  final String code;
  final String session;

  const SmsVerificationParams({required this.phoneNumber, required this.code, required this.session});

  @override
  List<Object?> get props => [phoneNumber];
}
