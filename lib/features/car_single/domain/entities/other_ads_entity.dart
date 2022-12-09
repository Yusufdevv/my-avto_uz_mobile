class OtherAdsEntity {
  final String imageUrl;
  final String model;
  final String price;
  final String location;
  final List<String> characteristic;

  const OtherAdsEntity({
    this.price = '',
    this.characteristic = const [],
    this.imageUrl = '',
    this.location = '',
    this.model = '',
  });
}
