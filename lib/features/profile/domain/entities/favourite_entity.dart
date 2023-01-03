class FavoriteEntity {
  FavoriteEntity({
    this.id,
    this.gallery,
    this.description,
    this.price,
    this.discount,
    this.absoluteCarName,
    this.isNew,
    this.userType,
    this.dealer,
    this.user,
    this.createdAt,
    this.region,
    this.isWishlisted,
  });

  int? id;
  List<String>? gallery;
  String? description;
  String? price;
  String? discount;
  String? absoluteCarName;
  bool? isNew;
  String? userType;
  Dealer? dealer;
  User? user;
  DateTime? createdAt;
  String? region;
  bool? isWishlisted;
}

class Dealer {
  Dealer({
    this.id,
    this.name,
    this.avatar,
  });

  int? id;
  String? name;
  String? avatar;

  factory Dealer.fromJson(Map<String, dynamic> json) => Dealer(
        id: json['id'],
        name: json['name'],
        avatar: json['avatar'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'avatar': avatar,
      };
}

class User {
  User({
    this.id,
    this.fullName,
    this.image,
  });

  int? id;
  String? fullName;
  String? image;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        fullName: json['full_name'],
        image: json['image'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'full_name': fullName,
        'image': image,
      };
}
