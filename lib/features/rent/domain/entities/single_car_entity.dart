class SingleCarsEntity {
  final List<String> images;
  final String carModel;
  final String price;
  final String yearIssue;
  final String mileage;
  final String carCase;
  final String color;
  final String equipment;
  final String sizeMotor;
  final String gearboxType;
  final bool hasFreezer;
  final String driveUnit;

  const SingleCarsEntity(
      {required this.images,
      required this.carModel,
      required this.price,
      required this.yearIssue,
      required this.mileage,
      required this.carCase,
      required this.color,
      required this.equipment,
      required this.sizeMotor,
      required this.gearboxType,
      required this.hasFreezer,
      required this.driveUnit});
}