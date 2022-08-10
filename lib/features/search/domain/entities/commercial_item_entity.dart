class CommercialItemEntity {
  final String autoName;
  final int autoYear;
  final String clientName;
  final String title;
  final String priceAuto;
  final String oldPriceAuto;
  final String clientAvatar;
  final String image1;
  final String image2;
  final bool isClient;
  final bool isSalon;
  final bool isLike;

  const CommercialItemEntity({
    required this.autoName,
    required this.autoYear,
    required this.clientName,
    required this.title,
    required this.priceAuto,
    required this.oldPriceAuto,
    required this.clientAvatar,
    required this.image1,
    required this.image2,
    this.isClient = false,
    this.isSalon = false,
    this.isLike = false,
  });
}
