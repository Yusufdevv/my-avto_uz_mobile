class FavouriteItemEntity {
  final List<String> images;
  final bool hasMileage;
  final String carStatus;
  final String carModel;
  final String carDate;
  final String price;
  final String hasDiscount;
  final String description;
  final String profileImage;
  final String name;
  final String userStatus;
  final String location;
  final String createdTime;

  FavouriteItemEntity({
    required this.images,
    required this.carStatus,
    required this.carModel,
    required this.carDate,
    required this.price,
    required this.hasDiscount,
    required this.description,
    required this.profileImage,
    required this.name,
    required this.userStatus,
    required this.location,
    required this.createdTime,
    this.hasMileage = true,
  });
}
