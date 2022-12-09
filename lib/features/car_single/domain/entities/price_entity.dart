class PriceEntity {
  final String status;
  final String price;
  final String startPrice;
  final String differentPrice;
  final String averagePrice;

  const PriceEntity({
    this.price = '',
    this.status = '',
    this.averagePrice = '',
    this.differentPrice = '',
    this.startPrice = '',
  });
}
