class RentCarEntity {
  final String url;
  final String carName;
  final String price;
  final String carModel;
  const RentCarEntity({required this.carName, required this.url, required this.price, this.carModel = '',});
}