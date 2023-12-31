import 'dart:async';

import 'package:auto/assets/constants/storage_keys.dart';
import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/bloc/auth/authentication_bloc.dart';
import 'package:auto/features/common/domain/model/token_model.dart';
import 'package:auto/features/common/domain/model/user.dart';
import 'package:auto/features/common/repository/global_request_repository.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  final GlobalRequestRepository repo = GlobalRequestRepository();
  final StreamController<AuthenticationStatus> authStream =
      StreamController.broadcast(sync: true);

  Future<Either<Failure, UserModel>> getUser() async {
    final result = await repo.getSingle(
      endpoint: '/users/detail/',
      fromJson: UserModel.fromJson,
    );
    return result;
  }

  Future<Either<Failure, TokenModel>> login(
      {required String login, required String password}) async {
    try {
      final result = await repo.postAndSingle<TokenModel>(
        endpoint: '/users/login/',
        fromJson: TokenModel.fromJson,
        sendToken: false,
        data: {
          'phone_number': '+998${login.replaceAll(' ', '')}',
          'password': password,
        },
      );
      if (result.isRight) {
        await StorageRepository.putString(
            StorageKeys.TOKEN, result.right.access);
        await StorageRepository.putString(
            StorageKeys.REFRESH, result.right.refresh);
        return Right(result.right);
      } else {
        return Left(result.left);
      }
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: '$e catch error');
    }
  }

  Future<Either<Failure, TokenModel>> refreshToken() async {
    final result = await repo.postAndSingle(
      endpoint: '/auth/token/refresh/',
      fromJson: TokenModel.fromJson,
      sendToken: false,
      data: {
        'refresh': StorageRepository.getString(StorageKeys.TOKEN, defValue: ''),
      },
    );
    if (result.isRight) {
      await StorageRepository.putString(StorageKeys.TOKEN, result.right.access);
      await StorageRepository.putString(
          StorageKeys.REFRESH, result.right.refresh);
      return Right(result.right);
    } else {
      return Left(result.left);
    }
  }

  Future<Either<Failure, TokenModel>> loginWithGoogle(
      {required String authToken, required String code}) async {
    final result = await repo.postAndSingle<TokenModel>(
      endpoint: 'users/social-auth/login/google/',
      fromJson: TokenModel.fromJson,
      sendToken: false,
      data: {'access_token': authToken, 'code': code},
    );
    if (result.isRight) {
      await StorageRepository.putString(
          StorageKeys.TOKEN, result.right.accessToken);
      await StorageRepository.putString(
          StorageKeys.REFRESH, result.right.refreshToken);
      return Right(result.right);
    } else {
      return Left(result.left);
    }
  }

  Future<Either<Failure, TokenModel>> loginWithFacebook(
      {required String authToken, required String code}) async {
    final result = await repo.postAndSingle<TokenModel>(
      endpoint: 'users/social-auth/login/facebook/',
      fromJson: TokenModel.fromJson,
      sendToken: false,
      data: {'access_token': authToken, 'code': ''},
    );
    if (result.isRight) {
      await StorageRepository.putString(
          StorageKeys.TOKEN, result.right.accessToken);
      await StorageRepository.putString(
          StorageKeys.REFRESH, result.right.refreshToken);
      return Right(result.right);
    } else {
      return Left(result.left);
    }
  }

  Future<Either<Failure, TokenModel>> loginWithApple(
      {required String authToken, required String code}) async {
    final result = await repo.postAndSingle<TokenModel>(
      endpoint: 'users/social-auth/login/apple/',
      fromJson: TokenModel.fromJson,
      sendToken: false,
      data: {'code': code},
    );
    if (result.isRight) {
      await StorageRepository.putString(
          StorageKeys.TOKEN, result.right.accessToken);
      await StorageRepository.putString(
          StorageKeys.REFRESH, result.right.refreshToken);
      return Right(result.right);
    } else {
      return Left(result.left);
    }
  }
}
