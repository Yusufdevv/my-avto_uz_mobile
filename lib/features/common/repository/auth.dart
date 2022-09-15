import 'dart:async';

import 'package:auto/core/error/failures.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/common/bloc/auth/authentication_bloc.dart';
import 'package:auto/features/common/domain/model/token_model.dart';
import 'package:auto/features/common/domain/model/user.dart';
import 'package:auto/features/common/repository/global_request_repository.dart';
import 'package:auto/utils/either.dart';



class AuthRepository {
  final GlobalRequestRepository repo = GlobalRequestRepository();
  final StreamController<AuthenticationStatus> authStream =
      StreamController.broadcast(sync: true);

  Future<Either<Failure, UserModel>> getUser() async {
    final result = await repo.getSingle(
      endpoint: '/auth/user/',
      fromJson: UserModel.fromJson,
    );
    return result;
  }

  Future<Either<Failure, TokenModel>> login(
      {required String login, required String password}) async {
    final result = await repo.postAndSingle<TokenModel>(
      endpoint: '/auth/login/',
      fromJson: TokenModel.fromJson,
      sendToken: false,
      data: {
        'phone_number': '+998$login',
        'password': password,
      },
    );

    if(result.isRight){
      await StorageRepository.putString('token', result.right.access);
      await StorageRepository.putString('refresh', result.right.refresh);
      return Right(result.right);
    }else {
      return Left(result.left);
    }

  }

  Future<Either<Failure, TokenModel>> refreshToken() async {
    final result = await repo.postAndSingle(
      endpoint: '/auth/token/refresh/',
      fromJson: TokenModel.fromJson,
      sendToken: false,
      data: {
        "refresh": StorageRepository.getString('token', defValue: ''),
      },
    );
    if(result.isRight){
      await StorageRepository.putString('token', result.right.access);
      await StorageRepository.putString('refresh', result.right.refresh);
      return Right(result.right);
    }else {
      return Left(result.left);
    }
  }
}
