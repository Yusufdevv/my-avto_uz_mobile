
class NotificationsEntity {
  NotificationsEntity({
   required this.notification,
    this.id,
    this.user,
    this.isRead,
  });

  int? id;
 final Notification notification;
  int? user;
  bool? isRead;

  factory NotificationsEntity.fromJson(Map<String, dynamic> json) => NotificationsEntity(
    id: json['id'],
    notification: Notification.fromJson(json['notification']),
    user: json['user'],
    isRead: json['is_read'],
  );

}

class Notification {
  Notification({
    this.id,
    this.category,
    this.title,
    this.cover,
    this.content,
    this.createdAt,
    this.readCount,
    this.toAll,
  });

  int? id;
  Category? category;
  String? title;
  String? cover;
  String? content;
  String? createdAt;
  int? readCount;
  bool? toAll;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    id: json['id'],
    category: json['category'] == null ? null : Category.fromJson(json['category']),
    title: json['title'],
    cover: json['cover'],
    content: json['content'],
    createdAt: json['created_at'] as String? ?? '',
    readCount: json['read_count'],
    toAll: json['to_all'],
  );

}

class Category {
  Category({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json['id'],
    name: json['name'],
  );
}

