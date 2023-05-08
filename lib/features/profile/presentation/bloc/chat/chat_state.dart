part of 'chat_bloc.dart';

class ChatState extends Equatable {
  final FormzStatus status;

  const ChatState({
    required this.status,
  });

  ChatState copyWith({
    FormzStatus? status,
  }) =>
      ChatState(
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [status];
}
