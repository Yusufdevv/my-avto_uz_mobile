import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class MessageEntity extends Equatable {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'user', defaultValue: '')
  final String user;
  @JsonKey(name: 'text', defaultValue: '')
  final String text;
  @JsonKey(name: 'date', defaultValue: null)
  final DateTime date;
  @JsonKey(name: 'isSendByMe', defaultValue: false)
  final bool isSendByMe;

  const MessageEntity(
      {required this.id,
      required this.user,
      required this.text,
      required this.date,
      required this.isSendByMe});

  @override
  List<Object> get props => [id, user, text, date, isSendByMe];

  MessageEntity copyWith({
    int? id,
    String? user,
    String? text,
    DateTime? date,
    bool? isSendByMe,
  }) =>
      MessageEntity(
        id: id ?? this.id,
        user: user ?? this.user,
        text: text ?? this.text,
        date: date ?? this.date,
        isSendByMe: isSendByMe ?? this.isSendByMe,
      );
}
