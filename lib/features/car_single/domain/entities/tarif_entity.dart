
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class TarifEntity extends Equatable{
  TarifEntity({
    this.id,
    this.type,
    this.amount,
  });

  int? id;
  String? type;
  String? amount;



  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'amount': amount,
  };

  @override
  List<Object?> get props => [id, type, amount];
}