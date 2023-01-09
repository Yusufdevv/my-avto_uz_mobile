import 'package:auto/features/profile/domain/entities/notifications_entity.dart';

class NotificationsModel extends NotificationsEntity {
  NotificationsModel({
   required super.id,
   required super.category,
   required super.title,
   required super.cover,
   required super.content,
   required super.createdAt,
   required super.readCount,
   required super.isRead,
  });
  
  factory NotificationsModel.fromJson(Map<String, dynamic> json) =>
      NotificationsModel(
        id: json['id'],
        category: json['category'] == null ? null : Category.fromJson(json['category']),
        title: json['title'],
        cover: json['cover'],
        content: json['content'],
        createdAt: json['created_at'],
        readCount: json['read_count'],
        isRead: json['is_read'],
      );
}
