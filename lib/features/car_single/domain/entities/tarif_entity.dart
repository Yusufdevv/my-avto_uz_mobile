
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class TarifEntity extends Equatable{
  TarifEntity({
   required this.id,
   required this.type,
   required this.amount,
   required this.typeInt,
  });

 final int id;
 final String type;
 final String amount;
 final int typeInt;



  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'amount': amount,
  };

  @override
  List<Object?> get props => [id, type, amount];
}