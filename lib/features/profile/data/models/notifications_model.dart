import 'package:auto/features/profile/domain/entities/notifications_entity.dart';

class NotificationsModel extends NotificationsEntity {
  NotificationsModel({
    required super.id,
    required super.notification,
    required super.user,
    required super.isRead,
  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) =>
      NotificationsModel(
        id: json['id'],
        notification:Notification.fromJson(json['notification']),
        user: json['user'],
        isRead: json['is_read'],
      );
}
