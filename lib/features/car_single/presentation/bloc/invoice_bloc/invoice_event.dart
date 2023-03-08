part of 'invoice_bloc.dart';

@immutable
abstract class InvoiceEvent {}

class GetTarifsEvent extends InvoiceEvent {}

class PayInvoiceEvent extends InvoiceEvent {
  final int announcement;
  final String provider;
  final String tariffType;
  final Function() onSucces;
  final Function() onError;

  PayInvoiceEvent({
    required this.announcement,
    required this.provider,
    required this.tariffType,
    required this.onSucces,
    required this.onError,
  });
}

class GetInvoiceStatusEvent extends InvoiceEvent {
  final Function() onSucces;
  final Function() onError;

  GetInvoiceStatusEvent({
    required this.onSucces,
    required this.onError,
  });

}
