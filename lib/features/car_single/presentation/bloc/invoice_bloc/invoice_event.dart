part of 'invoice_bloc.dart';

@immutable
abstract class InvoiceEvent {}

class GetTarifsEvent extends InvoiceEvent {
  final TarifTypeEnum tarifType;
  GetTarifsEvent({required this.tarifType});
}

class SetProviderEvent extends InvoiceEvent {
  final String provider;

  SetProviderEvent({required this.provider});
}

class PayInvoiceEvent extends InvoiceEvent {
  final int announcement;
  final Map<String, dynamic> params;
  final Function(String) onSucces;
  final Function() onError;

  PayInvoiceEvent({
    required this.announcement,
    required this.params,
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

class PickImageEvent extends InvoiceEvent {
  final ImageSource source;
  final int index;
  PickImageEvent({required this.source,required this.index});
}

class DeleteImageVideoEvent extends InvoiceEvent {
  final String path;

  DeleteImageVideoEvent({required this.path});
}
class PickVideoEvent extends InvoiceEvent {
  final ImageSource source;

  PickVideoEvent({required this.source});
}
