class CommercialItemEntity {
  final String autoName;
  final String model;
  final int autoYear;
  final String clientName;
  final String title;
  final String priceAuto;
  final String oldPriceAuto;
  final String clientAvatar;
  final List<String> images;
  final bool isSalon;
  final bool isLike;

  const CommercialItemEntity({
    required this.model,
    required this.autoName,
    required this.autoYear,
    required this.clientName,
    required this.title,
    required this.priceAuto,
    required this.oldPriceAuto,
    required this.clientAvatar,
    required this.images,
    this.isSalon = false,
    this.isLike = false,
  });
}
