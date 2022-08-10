class DealerInfoModel {
  final String dealerType;
  final String dealerName;
  final String dealerImageUrl;
  final int quantityOfCars;
  final String workingHours;
  final String contract;
  final String additionalInfo;
  final double longitude;
  final double latitude;
  DealerInfoModel(
      {required this.dealerType,
      required this.dealerName,
      required this.dealerImageUrl,
      required this.quantityOfCars,
      required this.workingHours,
      required this.contract,
      required this.additionalInfo,
      required this.latitude,
      required this.longitude});
}
