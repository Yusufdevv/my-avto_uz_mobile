import 'package:auto/core/error/failures.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/common/domain/model/token_model.dart';
import 'package:auto/features/common/repository/global_request_repository.dart';
import 'package:auto/features/login/data/models/register.dart';
import 'package:auto/utils/either.dart';
import 'package:dio/dio.dart';

class RegisterUseCase extends UseCase<TokenModel, RegisterModel> {
  final GlobalRequestRepository repo = GlobalRequestRepository();

  @override
  Future<Either<Failure, TokenModel>> call(model) async {
    final map = {
      'full_name': model.fullName,
      'region': model.region,
      'phone_number': model.phoneNumber.replaceAll(' ', ''),
      'email': model.email,
      'password': model.password,
    };

    if (model.image.isNotEmpty) {
      map.addAll({'image': await MultipartFile.fromFile(model.image)});
    }
    print(map.toString());
    final formData = FormData.fromMap(map);
    var result = await repo.postAndSingle(
        endpoint: '/users/registration/',
        fromJson: TokenModel.fromJson,
        responseDataKey: 'token',
        formData: formData,
        sendToken: false);
    if (result.isRight) {
      await StorageRepository.putString('token', result.right.access);
      await StorageRepository.putString('refresh', result.right.refresh);
      return Right(result.right);
    } else {
      return Left(result.left);
    }
  }
}
