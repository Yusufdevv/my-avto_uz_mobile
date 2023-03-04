import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class PaymentEntity extends Equatable {
 const PaymentEntity({
    this.id,
    this.paymentUrl,
  });

 final int? id;
 final String? paymentUrl;

  factory PaymentEntity.fromJson(Map<String, dynamic> json) => PaymentEntity(
        id: json['id'],
        paymentUrl: json['payment_url'],
      );

  // Map<String, dynamic> toJson() => {
  //       'id': id,
  //       'payment_url': paymentUrl,
  //     };

  @override
  List<Object?> get props => [id, paymentUrl];
}
