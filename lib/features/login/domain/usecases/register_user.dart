import 'package:auto/assets/constants/storage_keys.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/domain/model/token_model.dart';
import 'package:auto/features/common/repository/global_request_repository.dart';
import 'package:auto/features/login/data/models/register.dart';
import 'package:dio/dio.dart';

class RegisterUseCase extends UseCase<TokenModel, RegisterModel> {
  final GlobalRequestRepository repo = GlobalRequestRepository();

  @override
  Future<Either<Failure, TokenModel>> call(model) async {
    MultipartFile? multipartFile;
    var map = <String, dynamic>{};

    try {
      multipartFile = await MultipartFile.fromFile(model.image,
          filename: model.image.split('/').last);
      // ignore: avoid_catches_without_on_clauses, empty_catches
    } catch (e) {}

    map['full_name'] = model.fullName;
    if (model.region != 0) {
      map['region'] = model.region;
    }
    map['phone_number'] = model.phoneNumber.replaceAll(' ', '');
    map['email'] = model.email;
    map['password'] = model.password;
    multipartFile != null ? map['image'] = multipartFile : null;

    final formData = FormData.fromMap(map);

    final result = await repo.postAndSingle(
        endpoint: '/users/registration/',
        fromJson: TokenModel.fromJson,
        responseDataKey: StorageKeys.TOKEN,
        formData: formData,
        sendToken: false);
    if (result.isRight) {
      await StorageRepository.putString(StorageKeys.TOKEN, result.right.access);
      await StorageRepository.putString(
          StorageKeys.REFRESH, result.right.refresh);
      return Right(result.right);
    } else {
      return Left(result.left);
    }
  }
}
