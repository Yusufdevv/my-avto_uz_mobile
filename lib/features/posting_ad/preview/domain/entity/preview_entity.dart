class PreviewEntity{
  final String carModel;
  final String price;
  final String date;
  final String seenItem;
  final String id;
  final String seenToday;
  final List<String> images;

  PreviewEntity(
      {required this.carModel,
      required this.price,
      required this.seenToday,
      required this.date,
      required this.seenItem,
      required this.id,
      required this.images});
}