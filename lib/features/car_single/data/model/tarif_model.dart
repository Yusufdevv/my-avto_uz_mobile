import 'package:auto/features/car_single/domain/entities/tarif_entity.dart';

class TarifModel extends TarifEntity {
  TarifModel({
    required super.id,
    required super.amount,
    required super.type,
  });

  factory TarifModel.fromJson(Map<String, dynamic> json) => TarifModel(
    id: json['id'] as int? ?? -1,
    type: json['type'] as String? ?? '',
    amount: json['amount'] as String? ?? '',
  );
}
