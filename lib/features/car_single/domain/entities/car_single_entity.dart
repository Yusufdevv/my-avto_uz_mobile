class CarSingleEntity {
  final String autoName;
  final String price;
  final String date;
  final String views;
  final List<String> carComplectation;

  CarSingleEntity(
      {this.price = '',
      this.views = '',
      this.autoName = '',
       this.carComplectation = const [],
      this.date= ''});
}
