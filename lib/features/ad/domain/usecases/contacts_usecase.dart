import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';

class ContactsUseCase extends UseCase<String, String> {
  final AdRepository repository;
  ContactsUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(String params) =>
      repository.sendCode(phone: params);
}
