class DealerInfoEntity {
  final String dealerType;
  final String dealerName;
  final String dealerImageUrl;
  final int quantityOfCars;
  final String workingHours;
  final String contact;
  final String additionalInfo;
  final double longitude;
  final double latitude;
  DealerInfoEntity(
      {required this.dealerType,
      required this.dealerName,
      required this.dealerImageUrl,
      required this.quantityOfCars,
      required this.workingHours,
      required this.contact,
      required this.additionalInfo,
      required this.latitude,
      required this.longitude});
}
