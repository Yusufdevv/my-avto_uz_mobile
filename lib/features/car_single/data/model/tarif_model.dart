import 'package:auto/features/car_single/domain/entities/tarif_entity.dart';

class TarifModel extends TarifEntity {
  TarifModel({
    required super.id,
    required super.amount,
    required super.type,
    required super.typeInt,
  });

  factory TarifModel.fromJson(Map<String, dynamic> json) => TarifModel(
    id: json['id'],
    type: json['type'],
    amount: json['amount'],
    typeInt: json['type_int'],
  );
}
