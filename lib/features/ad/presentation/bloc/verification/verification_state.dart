part of 'verification_bloc.dart';

class VerificationState extends Equatable {
  final FormzStatus status;
  final String? session;
  const VerificationState({required this.status, this.session});

  VerificationState copyWith({FormzStatus? status, String? session}) =>
      VerificationState(
        status: status ?? this.status,
        session: session ?? this.session,
      );

  @override
  List<Object?> get props => [status, session];
}
