import 'dart:async';

import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/common/domain/model/user.dart';
import 'package:auto/features/common/repository/auth.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
  loading,
  cancelLoading
}

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository repository;
  late StreamSubscription<AuthenticationStatus> statusSubscription;

  AuthenticationBloc(this.repository)
      : super(AuthenticationState.unauthenticated()) {
    statusSubscription = repository.authStream.stream.listen((event) {
      add(AuthenticationStatusChanged(status: event));
    });
    on<AuthenticationStatusChanged>((event, emit) async {
      switch (event.status) {
        case AuthenticationStatus.authenticated:
          final userData = await repository.getUser();
          if (userData.isRight) {
            emit(AuthenticationState.authenticated(userData.right));
          } else {
            emit(AuthenticationState.unauthenticated());
          }
          break;
        case AuthenticationStatus.unauthenticated:
          emit(AuthenticationState.unauthenticated());
          break;
        case AuthenticationStatus.loading:
        case AuthenticationStatus.cancelLoading:
          break;
      }
    });

    on<LoginUser>((event, emit) async {
      emit(AuthenticationState.loading());
      final result = await repository.login(
          login: event.userName, password: event.password);
      if (result.isRight) {
        add(AuthenticationStatusChanged(
            status: AuthenticationStatus.authenticated));
      } else {
        if (event.onError != null) {
          event.onError!((result.left as ServerFailure).errorMessage);
        }
        emit(AuthenticationState.cancelLoading());
      }
    });

    on<CheckUser>((event, emit) async {
      final hasToken =
          StorageRepository.getString('token', defValue: '').isNotEmpty;
      if (hasToken) {
        final response = await repository.getUser();
        if (response.isRight) {
          add(AuthenticationStatusChanged(
              status: AuthenticationStatus.authenticated));
        } else {
          add(RefreshToken());
        }
      } else {
        add(AuthenticationStatusChanged(
            status: AuthenticationStatus.unauthenticated));
      }
    });
    on<RefreshToken>((event, emit) async {
      final result = await repository.refreshToken();
      if (result.isRight) {
        add(AuthenticationStatusChanged(
            status: AuthenticationStatus.authenticated));
      } else {
        add(AuthenticationStatusChanged(
            status: AuthenticationStatus.unauthenticated));
      }
    });

    on<ChangeNotificationAllRead>(
      (event, emit) {
        // ignore: prefer_final_locals
        var user = state.user;
        // ignore: cascade_invocations
        user.isReadAllNotifications = true;
        emit(state.copyWith(user: user));
      },
    );
  }

  @override
  Future<void> close() {
    statusSubscription.cancel();
    return super.close();
  }
}
