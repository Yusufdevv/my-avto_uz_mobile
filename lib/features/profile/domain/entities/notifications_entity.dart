class NotificationsEntity {
  int? id;
  Category? category;
  String? title;
  String? cover;
  String? content;
  String? createdAt;
  int? readCount;
  bool? isRead;

  NotificationsEntity({
    this.id,
    this.category,
    this.title,
    this.cover,
    this.content,
    this.createdAt,
    this.readCount,
    this.isRead,
  });
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
