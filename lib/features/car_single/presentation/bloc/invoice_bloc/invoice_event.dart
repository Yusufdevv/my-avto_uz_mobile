part of 'invoice_bloc.dart';

@immutable
abstract class InvoiceEvent {}

class GetTarifsEvent extends InvoiceEvent {}

class PayInvoiceEvent extends InvoiceEvent {
  final int announcement;
  final String provider;
  final String tariffType;

  PayInvoiceEvent({
    required this.announcement,
    required this.provider,
    required this.tariffType,
  });
}

class GetInvoiceStatusEvent extends InvoiceEvent {}
