part of 'invoice_bloc.dart';

@immutable
abstract class InvoiceEvent {}

class GetTarifsEvent extends InvoiceEvent {}

class SetProviderEvent extends InvoiceEvent {
  final String provider;

  SetProviderEvent({required this.provider});
}

class PayInvoiceEvent extends InvoiceEvent {
  final int announcement;
  final String provider;
  final String tariffType;
  final Function(String) onSucces;
  final Function() onError;

  PayInvoiceEvent({
    required this.announcement,
    required this.provider,
    required this.tariffType,
    required this.onSucces,
    required this.onError,
  });
}

class GetTransactionStatusEvent extends InvoiceEvent {
  final Function() onSucces;
  final Function() onError;
  final int orderId;

  GetTransactionStatusEvent({
    required this.onSucces,
    required this.onError,
    required this.orderId,
  });
}
