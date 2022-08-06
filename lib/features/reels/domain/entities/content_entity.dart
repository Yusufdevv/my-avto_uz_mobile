class ContentEntity {
  final String carName;
  final String price;
  final bool isDiscount;
  final String oldPrice;
  final String url;
  final String discountPercent;
  final String profileImage;
  final String companyName;

  const ContentEntity({
    required this.price,
    required this.profileImage,
    required this.companyName,
    required this.url,
    required this.carName,
    this.isDiscount = false,
    this.oldPrice = '',
    this.discountPercent = '',
  });
}
